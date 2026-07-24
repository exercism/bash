#!/usr/bin/env bats
load bats-extra

# generated on 2026-07-24T11:01:33+00:00

@test "calculate transmit sequences: empty message" {
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash intergalactic_transmission.sh transmit_sequence ""
    assert_success
    assert_output ""
}

@test "calculate transmit sequences: 0x00 is transmitted as 0x0000" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash intergalactic_transmission.sh transmit_sequence "0x00"
    assert_success
    assert_output "0x00 0x00"
}

@test "calculate transmit sequences: 0x02 is transmitted as 0x0300" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash intergalactic_transmission.sh transmit_sequence "0x02"
    assert_success
    assert_output "0x03 0x00"
}

@test "calculate transmit sequences: 0x06 is transmitted as 0x0600" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash intergalactic_transmission.sh transmit_sequence "0x06"
    assert_success
    assert_output "0x06 0x00"
}

@test "calculate transmit sequences: 0x05 is transmitted as 0x0581" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash intergalactic_transmission.sh transmit_sequence "0x05"
    assert_success
    assert_output "0x05 0x81"
}

@test "calculate transmit sequences: 0x29 is transmitted as 0x2881" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash intergalactic_transmission.sh transmit_sequence "0x29"
    assert_success
    assert_output "0x28 0x81"
}

@test "calculate transmit sequences: 0xc001c0de is transmitted as 0xc000711be1" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash intergalactic_transmission.sh transmit_sequence "0xc0 0x01 0xc0 0xde"
    assert_success
    assert_output "0xc0 0x00 0x71 0x1b 0xe1"
}

@test "calculate transmit sequences: six byte message" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash intergalactic_transmission.sh transmit_sequence "0x47 0x72 0x65 0x61 0x74 0x21"
    assert_success
    assert_output "0x47 0xb8 0x99 0xac 0x17 0xa0 0x84"
}

@test "calculate transmit sequences: seven byte message" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash intergalactic_transmission.sh transmit_sequence "0x47 0x72 0x65 0x61 0x74 0x31 0x21"
    assert_success
    assert_output "0x47 0xb8 0x99 0xac 0x17 0xa0 0xc5 0x42"
}

@test "calculate transmit sequences: eight byte message" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash intergalactic_transmission.sh transmit_sequence "0xc0 0x01 0x13 0x37 0xc0 0xde 0x21 0x21"
    assert_success
    assert_output "0xc0 0x00 0x44 0x66 0x7d 0x06 0x78 0x42 0x21 0x81"
}

@test "calculate transmit sequences: twenty byte message" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash intergalactic_transmission.sh transmit_sequence "0x45 0x78 0x65 0x72 0x63 0x69 0x73 0x6d 0x20 0x69 0x73 0x20 0x61 0x77 0x65 0x73 0x6f 0x6d 0x65 0x21"
    assert_success
    assert_output "0x44 0xbd 0x18 0xaf 0x27 0x1b 0xa5 0xe7 0x6c 0x90 0x1b 0x2e 0x33 0x03 0x84 0xee 0x65 0xb8 0xdb 0xed 0xd7 0x28 0x84"
}

@test "decode received messages: empty message" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash intergalactic_transmission.sh decode_message ""
    assert_success
    assert_output ""
}

@test "decode received messages: zero message" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash intergalactic_transmission.sh decode_message "0x00 0x00"
    assert_success
    assert_output "0x00"
}

@test "decode received messages: 0x0300 is decoded to 0x02" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash intergalactic_transmission.sh decode_message "0x03 0x00"
    assert_success
    assert_output "0x02"
}

@test "decode received messages: 0x0581 is decoded to 0x05" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash intergalactic_transmission.sh decode_message "0x05 0x81"
    assert_success
    assert_output "0x05"
}

@test "decode received messages: 0x2881 is decoded to 0x29" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash intergalactic_transmission.sh decode_message "0x28 0x81"
    assert_success
    assert_output "0x29"
}

@test "decode received messages: first byte has wrong parity" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash intergalactic_transmission.sh decode_message "0x07 0x00"
    assert_success
    assert_output --partial "wrong parity"
}

@test "decode received messages: second byte has wrong parity" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash intergalactic_transmission.sh decode_message "0x03 0x68"
    assert_success
    assert_output --partial "wrong parity"
}

@test "decode received messages: 0xcf4b00 is decoded to 0xce94" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash intergalactic_transmission.sh decode_message "0xcf 0x4b 0x00"
    assert_success
    assert_output "0xce 0x94"
}

@test "decode received messages: 0xe2566500 is decoded to 0xe2ad90" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash intergalactic_transmission.sh decode_message "0xe2 0x56 0x65 0x00"
    assert_success
    assert_output "0xe2 0xad 0x90"
}

@test "decode received messages: six byte message" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash intergalactic_transmission.sh decode_message "0x47 0xb8 0x99 0xac 0x17 0xa0 0x84"
    assert_success
    assert_output "0x47 0x72 0x65 0x61 0x74 0x21"
}

@test "decode received messages: seven byte message" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash intergalactic_transmission.sh decode_message "0x47 0xb8 0x99 0xac 0x17 0xa0 0xc5 0x42"
    assert_success
    assert_output "0x47 0x72 0x65 0x61 0x74 0x31 0x21"
}

@test "decode received messages: last byte has wrong parity" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash intergalactic_transmission.sh decode_message "0x47 0xb8 0x99 0xac 0x17 0xa0 0xc5 0x43"
    assert_success
    assert_output --partial "wrong parity"
}

@test "decode received messages: eight byte message" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash intergalactic_transmission.sh decode_message "0xc0 0x00 0x44 0x66 0x7d 0x06 0x78 0x42 0x21 0x81"
    assert_success
    assert_output "0xc0 0x01 0x13 0x37 0xc0 0xde 0x21 0x21"
}

@test "decode received messages: twenty byte message" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash intergalactic_transmission.sh decode_message "0x44 0xbd 0x18 0xaf 0x27 0x1b 0xa5 0xe7 0x6c 0x90 0x1b 0x2e 0x33 0x03 0x84 0xee 0x65 0xb8 0xdb 0xed 0xd7 0x28 0x84"
    assert_success
    assert_output "0x45 0x78 0x65 0x72 0x63 0x69 0x73 0x6d 0x20 0x69 0x73 0x20 0x61 0x77 0x65 0x73 0x6f 0x6d 0x65 0x21"
}

@test "decode received messages: wrong parity on 16th byte" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash intergalactic_transmission.sh decode_message "0x44 0xbd 0x18 0xaf 0x27 0x1b 0xa5 0xe7 0x6c 0x90 0x1b 0x2e 0x33 0x03 0x84 0xef 0x65 0xb8 0xdb 0xed 0xd7 0x28 0x84"
    assert_success
    assert_output --partial "wrong parity"
}

