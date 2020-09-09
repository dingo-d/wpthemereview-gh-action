#!/bin/sh -l

# Install WPThemeReview standards
composer require wptrt/wpthemereview dealerdirect/phpcodesniffer-composer-installer:^0.7

# Check the code with PHPCS. If prefix is set, include it in a check.
if [ -n "$3" ]; then
    vendor/squizlabs/php_codesniffer/bin/phpcs -p -s . --standard=WPThemeReview --parallel=8 --runtime-set minimum_supported_wp_version $1 --runtime-set testVersion $2- --runtime-set prefixes $3 --ignore=$4
else
    vendor/squizlabs/php_codesniffer/bin/phpcs -p -s . --standard=WPThemeReview --parallel=8 --runtime-set minimum_supported_wp_version $1 --runtime-set testVersion $2- --ignore=$4
fi
