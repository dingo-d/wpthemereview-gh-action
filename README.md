# WPThemeReview GitHub Action

A GitHub Action to perform automated pull request review that will run phpcs checks using the [WPThemeReview sniffs](https://github.com/WPTT/WPThemeReview/) for [PHP_CodeSniffer](https://github.com/squizlabs/PHP_CodeSniffer).

## Usage

Using this action will check the code in the pull request.

1. Create a `.github/workflows/ci.yml` file in your GitHub repo
2. Place the following code in your `ci.yml` file

```yml
name: Run code quality checks

on:
    pull_request:
        branches: [master, develop]

jobs:
  phpcs_check:
    name: Run PHPCS checks
    runs-on: ubuntu-latest
    steps:
        # Checkout repository
        - name: Checkout
          uses: actions/checkout@v2

        # Run phpcs checks
        - name: Run PHPCS inspection
          uses: dingo-d/wpthemereview-gh-action@0.0.2
          with:
            wp_version: 5.5.1
            php_version: 7.4
            prefix: "theme-prefix"
            ignore: "vendor,tests,.github"
```