#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-06T22:03:12+00:00

test_calculate_transmit_sequences_empty_message() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash intergalactic_transmission.sh transmit_sequence ""
    assert_success
    assert_output ""
}

test_calculate_transmit_sequences_0x00_is_transmitted_as_0x0000() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash intergalactic_transmission.sh transmit_sequence "0x00"
    assert_success
    assert_output "0x00 0x00"
}

test_calculate_transmit_sequences_0x02_is_transmitted_as_0x0300() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash intergalactic_transmission.sh transmit_sequence "0x02"
    assert_success
    assert_output "0x03 0x00"
}

test_calculate_transmit_sequences_0x06_is_transmitted_as_0x0600() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash intergalactic_transmission.sh transmit_sequence "0x06"
    assert_success
    assert_output "0x06 0x00"
}

test_calculate_transmit_sequences_0x05_is_transmitted_as_0x0581() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash intergalactic_transmission.sh transmit_sequence "0x05"
    assert_success
    assert_output "0x05 0x81"
}

test_calculate_transmit_sequences_0x29_is_transmitted_as_0x2881() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash intergalactic_transmission.sh transmit_sequence "0x29"
    assert_success
    assert_output "0x28 0x81"
}

test_calculate_transmit_sequences_0xc001c0de_is_transmitted_as_0xc000711be1() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash intergalactic_transmission.sh transmit_sequence "0xc0 0x01 0xc0 0xde"
    assert_success
    assert_output "0xc0 0x00 0x71 0x1b 0xe1"
}

test_calculate_transmit_sequences_six_byte_message() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash intergalactic_transmission.sh transmit_sequence "0x47 0x72 0x65 0x61 0x74 0x21"
    assert_success
    assert_output "0x47 0xb8 0x99 0xac 0x17 0xa0 0x84"
}

test_calculate_transmit_sequences_seven_byte_message() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash intergalactic_transmission.sh transmit_sequence "0x47 0x72 0x65 0x61 0x74 0x31 0x21"
    assert_success
    assert_output "0x47 0xb8 0x99 0xac 0x17 0xa0 0xc5 0x42"
}

test_calculate_transmit_sequences_eight_byte_message() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash intergalactic_transmission.sh transmit_sequence "0xc0 0x01 0x13 0x37 0xc0 0xde 0x21 0x21"
    assert_success
    assert_output "0xc0 0x00 0x44 0x66 0x7d 0x06 0x78 0x42 0x21 0x81"
}

test_calculate_transmit_sequences_twenty_byte_message() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash intergalactic_transmission.sh transmit_sequence "0x45 0x78 0x65 0x72 0x63 0x69 0x73 0x6d 0x20 0x69 0x73 0x20 0x61 0x77 0x65 0x73 0x6f 0x6d 0x65 0x21"
    assert_success
    assert_output "0x44 0xbd 0x18 0xaf 0x27 0x1b 0xa5 0xe7 0x6c 0x90 0x1b 0x2e 0x33 0x03 0x84 0xee 0x65 0xb8 0xdb 0xed 0xd7 0x28 0x84"
}

test_decode_received_messages_empty_message() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash intergalactic_transmission.sh decode_message ""
    assert_success
    assert_output ""
}

test_decode_received_messages_zero_message() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash intergalactic_transmission.sh decode_message "0x00 0x00"
    assert_success
    assert_output "0x00"
}

test_decode_received_messages_0x0300_is_decoded_to_0x02() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash intergalactic_transmission.sh decode_message "0x03 0x00"
    assert_success
    assert_output "0x02"
}

test_decode_received_messages_0x0581_is_decoded_to_0x05() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash intergalactic_transmission.sh decode_message "0x05 0x81"
    assert_success
    assert_output "0x05"
}

test_decode_received_messages_0x2881_is_decoded_to_0x29() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash intergalactic_transmission.sh decode_message "0x28 0x81"
    assert_success
    assert_output "0x29"
}

test_decode_received_messages_first_byte_has_wrong_parity() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash intergalactic_transmission.sh decode_message "0x07 0x00"
    assert_success
    assert_output --partial "wrong parity"
}

test_decode_received_messages_second_byte_has_wrong_parity() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash intergalactic_transmission.sh decode_message "0x03 0x68"
    assert_success
    assert_output --partial "wrong parity"
}

test_decode_received_messages_0xcf4b00_is_decoded_to_0xce94() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash intergalactic_transmission.sh decode_message "0xcf 0x4b 0x00"
    assert_success
    assert_output "0xce 0x94"
}

test_decode_received_messages_0xe2566500_is_decoded_to_0xe2ad90() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash intergalactic_transmission.sh decode_message "0xe2 0x56 0x65 0x00"
    assert_success
    assert_output "0xe2 0xad 0x90"
}

test_decode_received_messages_six_byte_message() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash intergalactic_transmission.sh decode_message "0x47 0xb8 0x99 0xac 0x17 0xa0 0x84"
    assert_success
    assert_output "0x47 0x72 0x65 0x61 0x74 0x21"
}

test_decode_received_messages_seven_byte_message() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash intergalactic_transmission.sh decode_message "0x47 0xb8 0x99 0xac 0x17 0xa0 0xc5 0x42"
    assert_success
    assert_output "0x47 0x72 0x65 0x61 0x74 0x31 0x21"
}

test_decode_received_messages_last_byte_has_wrong_parity() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash intergalactic_transmission.sh decode_message "0x47 0xb8 0x99 0xac 0x17 0xa0 0xc5 0x43"
    assert_success
    assert_output --partial "wrong parity"
}

test_decode_received_messages_eight_byte_message() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash intergalactic_transmission.sh decode_message "0xc0 0x00 0x44 0x66 0x7d 0x06 0x78 0x42 0x21 0x81"
    assert_success
    assert_output "0xc0 0x01 0x13 0x37 0xc0 0xde 0x21 0x21"
}

test_decode_received_messages_twenty_byte_message() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash intergalactic_transmission.sh decode_message "0x44 0xbd 0x18 0xaf 0x27 0x1b 0xa5 0xe7 0x6c 0x90 0x1b 0x2e 0x33 0x03 0x84 0xee 0x65 0xb8 0xdb 0xed 0xd7 0x28 0x84"
    assert_success
    assert_output "0x45 0x78 0x65 0x72 0x63 0x69 0x73 0x6d 0x20 0x69 0x73 0x20 0x61 0x77 0x65 0x73 0x6f 0x6d 0x65 0x21"
}

test_decode_received_messages_wrong_parity_on_16th_byte() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash intergalactic_transmission.sh decode_message "0x44 0xbd 0x18 0xaf 0x27 0x1b 0xa5 0xe7 0x6c 0x90 0x1b 0x2e 0x33 0x03 0x84 0xef 0x65 0xb8 0xdb 0xed 0xd7 0x28 0x84"
    assert_success
    assert_output --partial "wrong parity"
}
