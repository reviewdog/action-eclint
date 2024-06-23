# WARNING

reviewdog/action-eclint is no longer maintained.
Please use another action. See https://github.com/reviewdog/action-eclint/issues/29

# GitHub Action: Run eclint with reviewdog

[![Docker Image CI](https://github.com/reviewdog/action-eclint/workflows/Docker%20Image%20CI/badge.svg)](https://github.com/reviewdog/action-eclint/actions)
[![Release](https://img.shields.io/github/release/reviewdog/action-eclint?sort=semver)](https://github.com/reviewdog/action-eclint/releases)

This action runs [eclint](https://github.com/jedmao/eclint) with
[reviewdog](https://github.com/reviewdog/reviewdog) on pull requests to improve
code review experience.

[![github-pr-check sample](https://user-images.githubusercontent.com/3797062/65439130-a6043b80-de61-11e9-98b5-bd9567e184b0.png)](https://github.com/reviewdog/action-eclint/pull/1)
[![github-pr-review sample](https://user-images.githubusercontent.com/3797062/65439073-91c03e80-de61-11e9-9077-39d480fbad0d.png)](https://github.com/reviewdog/action-eclint/pull/1)

## Inputs

### `github_token`

**Required**. The default value is `github_token: ${{ github.token }}`'.

### `level`

Optional. Report level for reviewdog [info,warning,error].
It's same as `-level` flag of reviewdog.

### `reporter`

Reporter of reviewdog command [github-pr-check,github-check,github-pr-review].
Default is github-pr-check.
It's same as `-reporter` flag of reviewdog.

github-pr-review can use Markdown and add a link to rule page in reviewdog reports.

### `eclint_flags`

Optional. Flags and args of eclint command. Default: '.'

## Example usage

You can create [eclint config](https://editorconfig.org/) and this action uses that config too.

### [.github/workflows/reviewdog.yml](.github/workflows/reviewdog.yml)

```yml
name: reviewdog
on: [pull_request]
jobs:
  eclint:
    name: runner / eclint
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: eclint
        uses: reviewdog/action-eclint@v1
        with:
          github_token: ${{ secrets.github_token }}
          reporter: github-pr-review # Change reporter.
          eclint_flags: 'src/'
```
