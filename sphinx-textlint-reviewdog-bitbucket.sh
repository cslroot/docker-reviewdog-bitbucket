#!/bin/bash
set -e

target=$1

textlint_exit_val="0"
reviewdog_exit_val="0"

textlint_check_output=$(pipenv run npx textlint -f checkstyle "${target}" --config .textlintrc 2>&1) \
                      || textlint_exit_val="$?"
echo "${textlint_check_output}"
echo "${textlint_exit_val}"

echo "${textlint_check_output}" | reviewdog \
        -f=checkstyle \
        -name=textlint \
        -reporter=bitbucket-code-report \
        -filter-mode=nofilter \
        -fail-on-error=false \
        -level=error \
         || reviewdog_exit_val="$?"
