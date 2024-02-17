#!/usr/bin/env bash

# Namerefs require bash version 4.3 or greater
bash_version=$((10 * BASH_VERSINFO[0] + BASH_VERSINFO[1]))
if (( bash_version < 43 )); then
    echo "This library requires at least bash version 4.3" >&2
    return 4
fi

# I'm storing all the data for all circular buffers in a single global
# associative array.
# Empty cells are denoted by empty strings.
# Therefore, an empty string cannot be stored in this circular buffer

declare -gA _buffer_data=()

buffer::new() {
    local name=$1
    local size=$2
    _buffer_data[size,$name]=$size
    buffer::clear "$name"
}

buffer::destroy() {
    local name=$1
    for ((idx = 0; idx < ${_buffer_data[size,$name]}; idx++)); do
        unset "_buffer_data[$idx,$name]"
    done
    unset "_buffer_data[read,$name]"
    unset "_buffer_data[write,$name]"
    unset "_buffer_data[size,$name]"
}

buffer::clear() {
    local name=$1
    _buffer_data[read,$name]=0
    _buffer_data[write,$name]=0
    for ((idx = 0; idx < ${_buffer_data[size,$name]}; idx++)); do
        _buffer_data[$idx,$name]=''
    done
}

buffer::is_empty() {
    local name=$1
    local idx=${_buffer_data[read,$name]}
    [[ -z ${_buffer_data[$idx,$name]} ]]
}

buffer::is_full() {
    local name=$1
    local idx=${_buffer_data[write,$name]}
    [[ -n ${_buffer_data[$idx,$name]} ]]
}

buffer::read() {
    local name=$1
    local -n _read_value=$2
    if buffer::is_empty "$name"; then
        return 1
    fi

    local idx=${_buffer_data[read,$name]}
    _read_value=${_buffer_data[$idx,$name]}
    _buffer_data[$idx,$name]=''

    buffer::incr_pointer "$name" read
}

buffer::write() {
    local name=$1 item=$2
    if buffer::is_full "$name"; then
        return 1
    fi

    local idx=${_buffer_data[write,$name]}
    _buffer_data[$idx,$name]=$item

    buffer::incr_pointer "$name" write
}

buffer::incr_pointer() {
    local name=$1 p=$2
    _buffer_data[$p,$name]=$(( (_buffer_data[$p,$name] + 1) % _buffer_data[size,$name] ))
}

buffer::overwrite() {
    local name=$1 item=$2
    if buffer::is_full "$name"; then
        # shellcheck disable=SC2034
        local tmp
        buffer::read "$name" tmp
    fi
    buffer::write "$name" "$item"
}
