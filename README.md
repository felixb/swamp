# SWAMP: Profile Manager for AWS

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

## Install

Fetch the latest binary from https://github.com/felixb/swamp/releases or run `make` to compile it yourself.