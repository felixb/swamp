# Changelog

## swamp v0.7-snapshot

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
