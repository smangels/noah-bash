#!/bin/bash

# this test script will test 5 kinds of cases of user input for the script chop.sh
# if 1, zero string, 2, negative index, 3, no index, 4, no arguments, 5, index > length

set -e
function _test_case()
{
    p1=$1
    p2=$2
    expected_ret=$3
    expected_output=$4

    # call UUT
    # need check for the script chop.sh exist in the right path and executable, how? 
    actual_ret=$(./chop.sh "${p1}"  "${p2}")

    if [[ "${expected_ret}" != "${actual_ret}" ]]; then
        echo "test failed"
        
    else
        echo "test passed"
    fi
}

# 1st case test, 
echo "general test"
_test_case "numbers" 2 "nu" 0
echo " "

# 2nd case test, inputs string and negative index values, expect returen "" , exp output 1
echo "Missuse test"
_test_case "numbers" -2 "Error: you must be input appropriate string and index " 2
_test_case "numbers" 30 "Error: you must be input appropriate string and index " 2
echo " "

# 3rd case test, inputs string and no index values, expect get error back
echo "Help Facility Test"
_test_case "numbers" "" "Usage: chop <string> <index>" 1 
_test_case "numbers" "-h" "Usage: chop <string> <index>" 1 
_test_case "numbers" "--help" "Usage: chop <string> <index>" 1 
_test_case "" "" "Usage: chop <string> <index>" 1 


