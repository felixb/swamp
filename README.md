# SWAMP: Profile Manager for AWS [![build](https://github.com/felixb/swamp/actions/workflows/go.yml/badge.svg)](https://github.com/felixb/swamp/actions/workflows/go.yml)

You can use `swamp` to switch AWS profiles with ease.

## Use case

`swamp` assumes you have an AWS account with CLI access credentials and you want to assume role into a set of AWS accounts from there.
`swamp` optionally supports MFA authentication before assuming the target role.

### Without MFA

`swamp` calls `aws sts assume-role` and writes the returned credentials into the specified target profile.

#### Example:

Create a session token based on your default profile:

```
$ swamp -profile default -target-profile target -target-role admin -account [target-account-id]
Wrote session token for profile target
Token is valid until: 2017-07-06 08:31:10 +0000 UTC
```

Create a session token based on your instance profile when running in an ec2 instance or ecs task:

```
$ swamp -instance -target-profile target -target-role admin -account [target-account-id]
Wrote session token for profile target
Token is valid until: 2017-07-06 08:31:10 +0000 UTC
```

### With MFA

`swamp` calls `aws sts get-session-token` with MFA authentication to obtain a profile with enabled MFA. The returned credentials are written to the specified intermediate profile.
Subsequent calls may skip that step as long as the session token is still valid.
With these intermediate credentials `aws sts assume-role` is called as above.

#### Example:

```
$ swamp -target-profile target -target-role admin -account [target-account-id] -mfa-device arn:aws:iam::[origin-account-id]:mfa/[userid]
Enter mfa token for arn:aws:iam::[origin-account-id]:mfa/[userid]: XXXXXX
Wrote session token for profile session-token
Token is valid until: 2017-07-06 20:32:09 +0000 UTC
Wrote session token for profile target
Token is valid until: 2017-07-06 08:31:10 +0000 UTC
```

And run it again:

```
$ swamp -target-profile target -target-role admin -account [target-account-id] -mfa-device arn:aws:iam::[origin-account-id]:mfa/[userid]
Session token for profile session-token is still valid
Wrote session token for profile target
Token is valid until: 2017-07-06 08:32:15 +0000 UTC
```

Or create a session profile only:

```
$ swamp -mfa-device arn:aws:iam::[origin-account-id]:mfa/[userid]
Enter mfa token for arn:aws:iam::[origin-account-id]:mfa/[userid]: XXXXXX
Wrote session token for profile session-token
Token is valid until: 2017-07-06 20:32:09 +0000 UTC
```

### Auto-Obtain MFA Token

If using swamp with an mfa-enabled account you can use the `-mfa-exec` flag to tell swamp to try to obtain the token itself.
You need to give an executable command which returns the 6-digit code.

swamp is known to integrate well with the following tools:

* [pass](https://www.passwordstore.org/) / [pass-otp](https://github.com/tadfisher/pass-otp): `-mfa-exec "pass otp amazonaws.com"`
* [ykman](https://developers.yubico.com/yubikey-manager/): `-mfa-exec "ykman oath code amazonaws.com | awk '{ print $NF }'"`

#### Example:

```
$ swamp -target-profile target -target-role admin -account [target-account-id] -mfa-device arn:aws:iam::[origin-account-id]:mfa/[userid] -mfa-exec "pass otp amazonaws.com"
Obtaining mfa token for: arn:aws:iam::[origin-account-id]:mfa/[userid]
Wrote session token for profile session-token
Token is valid until: 2017-07-06 20:32:09 +0000 UTC
Wrote session token for profile target
Token is valid until: 2017-07-06 08:31:10 +0000 UTC
```

### Renew

`swamp` allows running in a loop to create a new profile for the target account before credentials expire.
It even works with enabled MFA thanks to the cached intermediate credentials.

#### Example

```
$ swamp -target-profile target -target-role admin -account [target-account-id] -mfa-device arn:aws:iam::[origin-account-id]:mfa/[userid] -renew
Enter mfa token for arn:aws:iam::[origin-account-id]:mfa/[userid]: XXXXXX
Wrote session token for profile session-token
Token is valid until: 2017-07-06 20:32:09 +0000 UTC
Wrote session token for profile target
Token is valid until: 2017-07-06 08:31:10 +0000 UTC
Session token for profile session-token is still valid
Wrote session token for profile target
Token is valid until: 2017-07-06 08:46:10 +0000 UTC
...
```

### Set profile in environment
`swamp` allows setting a profile as `AWS_PROFILE` in the environment. In order to activate this, at least `-export-profile` must be set.
This tells swamp to write the profile to the a file (default is `/tmp/current_swamp_profile`) which can then be sourced and used in your shell. If you want to specify the file the profile is written to, you must also set `export-file`.

#### Example
With `export-file`:
```
$ swamp -target-profile target -target-role admin -account [target-account-id] -mfa-device arn:aws:iam::[origin-account-id]:mfa/[userid] -export-profile && source /tmp/current_swamp_profile
```

When setting `export-file` yourself:
```
$ swamp -target-profile target -target-role admin -account [target-account-id] -mfa-device arn:aws:iam::[origin-account-id]:mfa/[userid] -export-profile -export-file [/path/to/file] && source [/path/to/file]
```

### Generating shell aliases
`swamp` has a lot of command line options. It is strongly recommended to create some kind of aliases for running swamp more easily.
`swamp -alias-config <config.yaml>` does exactly that:
```
swamp -alias-config example/config.yaml >> ~/.bashrc
```
The output `example/bash_aliases.sh` file is generated from the example config `example/config.yaml`.


## Install

### General
Fetch the latest binary from https://github.com/felixb/swamp/releases.
You may install it from source by running `make install` optionally setting something like  `TARGET=/usr/local/bin/` to specify a different installation target.

### macOS
You can install swamp on macOS using [brew](https://brew.sh/) with a third-party repository. Simply run `brew tap splieth/swamp` to add the repository and then `brew install swamp` to install the binary.
