#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-08T06:49:56+00:00

test_age_on_earth() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash space_age.sh "Earth" 1000000000
    assert_success
    assert_output 31.69
}

test_age_on_mercury() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash space_age.sh "Mercury" 2134835688
    assert_success
    assert_output 280.88
}

test_age_on_venus() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash space_age.sh "Venus" 189839836
    assert_success
    assert_output 9.78
}

test_age_on_mars() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash space_age.sh "Mars" 2129871239
    assert_success
    assert_output 35.88
}

test_age_on_jupiter() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash space_age.sh "Jupiter" 901876382
    assert_success
    assert_output 2.41
}

test_age_on_saturn() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash space_age.sh "Saturn" 2000000000
    assert_success
    assert_output 2.15
}

test_age_on_uranus() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash space_age.sh "Uranus" 1210123456
    assert_success
    assert_output 0.46
}

test_age_on_neptune() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash space_age.sh "Neptune" 1821023456
    assert_success
    assert_output 0.35
}

test_invalid_planet_causes_error() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash space_age.sh "Sun" 680804807
    assert_failure
    assert_output --partial "not a planet"
}
