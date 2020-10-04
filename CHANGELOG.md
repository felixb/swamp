# Changelog

## swamp v0.12.0

* `-alias-config`: generate lowercase profile names and aliases
* `-export-profile` and `-export-file`: removed. Please use `-exec` instead. E.g. `-exec bash`.

## swamp v0.11.0

* `-alias-config`: support roles with `/`

## swamp v0.10.0

* `-alias-config` generates shell aliases

## swamp v0.9.1

* fix finding aws credentials on windows

## swamp v0.9

* `-quiet` suppresses output
* more explicit error messages for windows users

## swamp v0.8.2

* fix string escaping

## swamp v0.8.1

* add details to error messages

## swamp v0.8

* `-exec` allows executing command with the target role assumed
* write current default region to all profiles

## swamp v0.7

* `-mfa-exec` allows to automatically obtain the mfa-device token
* `-target-profile` defaults to `swamp`
* `-profile` defaults to ``
* `-region` defaults to ``
* `-instance` is deprecated and replaced by no-op
* obey environment variable `AWS_SHARED_CREDENTIALS_FILE`
* hide flags `-export-profile` and `-export-file` on windows

## swamp v0.6

* add locking for credentials file (#6)

## swamp v0.5.2

* enable cgo for default linux build
* disable cgo for alpine linux build

## swamp v0.5.1

* disable cgo for linux build

## swamp v0.5

* Support windows
* Strip blanks from mfa input

## swamp v0.4

* Use existing session name for new sessions
* Write file for easy setting target profile in your shell (#5)

## swamp v0.3

* Allow setting `--target-role` as `arn` (#4)

## swamp v0.2

* Allow using instance profiles on ec2 and ecs

## swamp v0.1

* Initial release
