#!/usr/bin/env bash

# Namerefs require bash version 4.3 or greater
bash_version=$((10 * BASH_VERSINFO[0] + BASH_VERSINFO[1]))
if (( bash_version < 43 )); then
    echo "This library requires at least bash version 4.3" >&2
    return 4
fi

# Create a new circular buffer with the given name and size.
buffer::new() {
    local name=$1 size=$2
    echo "Implement me" >&2
    exit 1
}

# Optionally, destroy an existing circular buffer.
# Your implementation may not need to do anything; if so leave this function empty.
buffer::destroy() {
    local name=$1
}

# Wipe out any existing data in the buffer.
buffer::clear() {
    local name=$1
    echo "Implement me" >&2
    exit 1
}

# Find the oldest element in the buffer.
# Set the given variable to hold the value.
# Remove the element from the buffer.
# Return a failure status if the buffer is empty, otherwise return success.
buffer::read() {
    local name=$1
    local -n _read_value=$2
    echo "Implement me" >&2
    exit 1
}

# Write a new value into the buffer.
# Return a failure status if the buffer is full, otherwise return success.
buffer::write() {
    local name=$1 item=$2
    echo "Implement me" >&2
    exit 1
}

# Write a new value into the buffer.
# If the buffer is full, overwrite the oldest element.
buffer::overwrite() {
    local name=$1 item=$2
    echo "Implement me" >&2
    exit 1
}
