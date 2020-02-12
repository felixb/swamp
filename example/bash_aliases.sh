# This aliases are generated with swamp

function swamp-team1-nonlive-readonly() {
  SWAMP_TARGET_PROFILE='team1-nonlive-readonly' \
    SWAMP_ACCOUNT='XXXXXXXXX1' \
    SWAMP_ACCOUNT_NAME='nonlive' \
    SWAMP_TARGET_ROLE='readonly' \
    swamp -region eu-central-1 -profile default -mfa-device arn:aws:iam::AAAAAAAAA:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/default' -account 'XXXXXXXXX1' -target-role 'readonly' -target-profile 'team1-nonlive-readonly' "${@}"
}

function swamp-team1-nonlive-readonly-bash() {
  SWAMP_TARGET_PROFILE='team1-nonlive-readonly' \
    SWAMP_ACCOUNT='XXXXXXXXX1' \
    SWAMP_ACCOUNT_NAME='nonlive' \
    SWAMP_TARGET_ROLE='readonly' \
    swamp -region eu-central-1 -profile default -mfa-device arn:aws:iam::AAAAAAAAA:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/default' -account 'XXXXXXXXX1' -target-role 'readonly' -target-profile 'team1-nonlive-readonly' -exec "bash"
}

function swamp-team1-nonlive-readonly-info() {
  SWAMP_TARGET_PROFILE='team1-nonlive-readonly' \
    SWAMP_ACCOUNT='XXXXXXXXX1' \
    SWAMP_ACCOUNT_NAME='nonlive' \
    SWAMP_TARGET_ROLE='readonly' \
    swamp -region eu-central-1 -profile default -mfa-device arn:aws:iam::AAAAAAAAA:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/default' -account 'XXXXXXXXX1' -target-role 'readonly' -target-profile 'team1-nonlive-readonly' -exec "aws sts get-caller-identity --output json"
}

function swamp-team1-nonlive-readonly-tf-init() {
  SWAMP_TARGET_PROFILE='team1-nonlive-readonly' \
    SWAMP_ACCOUNT='XXXXXXXXX1' \
    SWAMP_ACCOUNT_NAME='nonlive' \
    SWAMP_TARGET_ROLE='readonly' \
    swamp -region eu-central-1 -profile default -mfa-device arn:aws:iam::AAAAAAAAA:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/default' -account 'XXXXXXXXX1' -target-role 'readonly' -target-profile 'team1-nonlive-readonly' -exec "cd '${1}' && terraform init"
}

function swamp-team1-nonlive-developer() {
  SWAMP_TARGET_PROFILE='team1-nonlive-developer' \
    SWAMP_ACCOUNT='XXXXXXXXX1' \
    SWAMP_ACCOUNT_NAME='nonlive' \
    SWAMP_TARGET_ROLE='developer' \
    swamp -region eu-central-1 -profile default -mfa-device arn:aws:iam::AAAAAAAAA:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/default' -account 'XXXXXXXXX1' -target-role 'developer' -target-profile 'team1-nonlive-developer' "${@}"
}

function swamp-team1-nonlive-developer-bash() {
  SWAMP_TARGET_PROFILE='team1-nonlive-developer' \
    SWAMP_ACCOUNT='XXXXXXXXX1' \
    SWAMP_ACCOUNT_NAME='nonlive' \
    SWAMP_TARGET_ROLE='developer' \
    swamp -region eu-central-1 -profile default -mfa-device arn:aws:iam::AAAAAAAAA:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/default' -account 'XXXXXXXXX1' -target-role 'developer' -target-profile 'team1-nonlive-developer' -exec "bash"
}

function swamp-team1-nonlive-developer-info() {
  SWAMP_TARGET_PROFILE='team1-nonlive-developer' \
    SWAMP_ACCOUNT='XXXXXXXXX1' \
    SWAMP_ACCOUNT_NAME='nonlive' \
    SWAMP_TARGET_ROLE='developer' \
    swamp -region eu-central-1 -profile default -mfa-device arn:aws:iam::AAAAAAAAA:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/default' -account 'XXXXXXXXX1' -target-role 'developer' -target-profile 'team1-nonlive-developer' -exec "aws sts get-caller-identity --output json"
}

function swamp-team1-nonlive-developer-tf-init() {
  SWAMP_TARGET_PROFILE='team1-nonlive-developer' \
    SWAMP_ACCOUNT='XXXXXXXXX1' \
    SWAMP_ACCOUNT_NAME='nonlive' \
    SWAMP_TARGET_ROLE='developer' \
    swamp -region eu-central-1 -profile default -mfa-device arn:aws:iam::AAAAAAAAA:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/default' -account 'XXXXXXXXX1' -target-role 'developer' -target-profile 'team1-nonlive-developer' -exec "cd '${1}' && terraform init"
}

function swamp-team1-nonlive-admin() {
  SWAMP_TARGET_PROFILE='team1-nonlive-admin' \
    SWAMP_ACCOUNT='XXXXXXXXX1' \
    SWAMP_ACCOUNT_NAME='nonlive' \
    SWAMP_TARGET_ROLE='admin' \
    swamp -region eu-central-1 -profile default -mfa-device arn:aws:iam::AAAAAAAAA:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/default' -account 'XXXXXXXXX1' -target-role 'admin' -target-profile 'team1-nonlive-admin' "${@}"
}

function swamp-team1-nonlive-admin-bash() {
  SWAMP_TARGET_PROFILE='team1-nonlive-admin' \
    SWAMP_ACCOUNT='XXXXXXXXX1' \
    SWAMP_ACCOUNT_NAME='nonlive' \
    SWAMP_TARGET_ROLE='admin' \
    swamp -region eu-central-1 -profile default -mfa-device arn:aws:iam::AAAAAAAAA:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/default' -account 'XXXXXXXXX1' -target-role 'admin' -target-profile 'team1-nonlive-admin' -exec "bash"
}

function swamp-team1-nonlive-admin-info() {
  SWAMP_TARGET_PROFILE='team1-nonlive-admin' \
    SWAMP_ACCOUNT='XXXXXXXXX1' \
    SWAMP_ACCOUNT_NAME='nonlive' \
    SWAMP_TARGET_ROLE='admin' \
    swamp -region eu-central-1 -profile default -mfa-device arn:aws:iam::AAAAAAAAA:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/default' -account 'XXXXXXXXX1' -target-role 'admin' -target-profile 'team1-nonlive-admin' -exec "aws sts get-caller-identity --output json"
}

function swamp-team1-nonlive-admin-tf-init() {
  SWAMP_TARGET_PROFILE='team1-nonlive-admin' \
    SWAMP_ACCOUNT='XXXXXXXXX1' \
    SWAMP_ACCOUNT_NAME='nonlive' \
    SWAMP_TARGET_ROLE='admin' \
    swamp -region eu-central-1 -profile default -mfa-device arn:aws:iam::AAAAAAAAA:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/default' -account 'XXXXXXXXX1' -target-role 'admin' -target-profile 'team1-nonlive-admin' -exec "cd '${1}' && terraform init"
}

function swamp-team1-live-readonly() {
  SWAMP_TARGET_PROFILE='team1-live-readonly' \
    SWAMP_ACCOUNT='YYYYYYYYY1' \
    SWAMP_ACCOUNT_NAME='live' \
    SWAMP_TARGET_ROLE='readonly' \
    swamp -region eu-central-1 -profile default -mfa-device arn:aws:iam::AAAAAAAAA:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/default' -account 'YYYYYYYYY1' -target-role 'readonly' -target-profile 'team1-live-readonly' "${@}"
}

function swamp-team1-live-readonly-bash() {
  SWAMP_TARGET_PROFILE='team1-live-readonly' \
    SWAMP_ACCOUNT='YYYYYYYYY1' \
    SWAMP_ACCOUNT_NAME='live' \
    SWAMP_TARGET_ROLE='readonly' \
    swamp -region eu-central-1 -profile default -mfa-device arn:aws:iam::AAAAAAAAA:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/default' -account 'YYYYYYYYY1' -target-role 'readonly' -target-profile 'team1-live-readonly' -exec "bash"
}

function swamp-team1-live-readonly-info() {
  SWAMP_TARGET_PROFILE='team1-live-readonly' \
    SWAMP_ACCOUNT='YYYYYYYYY1' \
    SWAMP_ACCOUNT_NAME='live' \
    SWAMP_TARGET_ROLE='readonly' \
    swamp -region eu-central-1 -profile default -mfa-device arn:aws:iam::AAAAAAAAA:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/default' -account 'YYYYYYYYY1' -target-role 'readonly' -target-profile 'team1-live-readonly' -exec "aws sts get-caller-identity --output json"
}

function swamp-team1-live-readonly-tf-init() {
  SWAMP_TARGET_PROFILE='team1-live-readonly' \
    SWAMP_ACCOUNT='YYYYYYYYY1' \
    SWAMP_ACCOUNT_NAME='live' \
    SWAMP_TARGET_ROLE='readonly' \
    swamp -region eu-central-1 -profile default -mfa-device arn:aws:iam::AAAAAAAAA:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/default' -account 'YYYYYYYYY1' -target-role 'readonly' -target-profile 'team1-live-readonly' -exec "cd '${1}' && terraform init"
}

function swamp-team1-live-developer() {
  SWAMP_TARGET_PROFILE='team1-live-developer' \
    SWAMP_ACCOUNT='YYYYYYYYY1' \
    SWAMP_ACCOUNT_NAME='live' \
    SWAMP_TARGET_ROLE='developer' \
    swamp -region eu-central-1 -profile default -mfa-device arn:aws:iam::AAAAAAAAA:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/default' -account 'YYYYYYYYY1' -target-role 'developer' -target-profile 'team1-live-developer' "${@}"
}

function swamp-team1-live-developer-bash() {
  SWAMP_TARGET_PROFILE='team1-live-developer' \
    SWAMP_ACCOUNT='YYYYYYYYY1' \
    SWAMP_ACCOUNT_NAME='live' \
    SWAMP_TARGET_ROLE='developer' \
    swamp -region eu-central-1 -profile default -mfa-device arn:aws:iam::AAAAAAAAA:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/default' -account 'YYYYYYYYY1' -target-role 'developer' -target-profile 'team1-live-developer' -exec "bash"
}

function swamp-team1-live-developer-info() {
  SWAMP_TARGET_PROFILE='team1-live-developer' \
    SWAMP_ACCOUNT='YYYYYYYYY1' \
    SWAMP_ACCOUNT_NAME='live' \
    SWAMP_TARGET_ROLE='developer' \
    swamp -region eu-central-1 -profile default -mfa-device arn:aws:iam::AAAAAAAAA:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/default' -account 'YYYYYYYYY1' -target-role 'developer' -target-profile 'team1-live-developer' -exec "aws sts get-caller-identity --output json"
}

function swamp-team1-live-developer-tf-init() {
  SWAMP_TARGET_PROFILE='team1-live-developer' \
    SWAMP_ACCOUNT='YYYYYYYYY1' \
    SWAMP_ACCOUNT_NAME='live' \
    SWAMP_TARGET_ROLE='developer' \
    swamp -region eu-central-1 -profile default -mfa-device arn:aws:iam::AAAAAAAAA:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/default' -account 'YYYYYYYYY1' -target-role 'developer' -target-profile 'team1-live-developer' -exec "cd '${1}' && terraform init"
}

function swamp-team1-infrastructure-readonly() {
  SWAMP_TARGET_PROFILE='team1-infrastructure-readonly' \
    SWAMP_ACCOUNT='ZZZZZZZZZ1' \
    SWAMP_ACCOUNT_NAME='infrastructure' \
    SWAMP_TARGET_ROLE='readonly' \
    swamp -region eu-central-1 -profile default -mfa-device arn:aws:iam::AAAAAAAAA:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/default' -account 'ZZZZZZZZZ1' -target-role 'readonly' -target-profile 'team1-infrastructure-readonly' "${@}"
}

function swamp-team1-infrastructure-readonly-bash() {
  SWAMP_TARGET_PROFILE='team1-infrastructure-readonly' \
    SWAMP_ACCOUNT='ZZZZZZZZZ1' \
    SWAMP_ACCOUNT_NAME='infrastructure' \
    SWAMP_TARGET_ROLE='readonly' \
    swamp -region eu-central-1 -profile default -mfa-device arn:aws:iam::AAAAAAAAA:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/default' -account 'ZZZZZZZZZ1' -target-role 'readonly' -target-profile 'team1-infrastructure-readonly' -exec "bash"
}

function swamp-team1-infrastructure-readonly-info() {
  SWAMP_TARGET_PROFILE='team1-infrastructure-readonly' \
    SWAMP_ACCOUNT='ZZZZZZZZZ1' \
    SWAMP_ACCOUNT_NAME='infrastructure' \
    SWAMP_TARGET_ROLE='readonly' \
    swamp -region eu-central-1 -profile default -mfa-device arn:aws:iam::AAAAAAAAA:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/default' -account 'ZZZZZZZZZ1' -target-role 'readonly' -target-profile 'team1-infrastructure-readonly' -exec "aws sts get-caller-identity --output json"
}

function swamp-team1-infrastructure-readonly-tf-init() {
  SWAMP_TARGET_PROFILE='team1-infrastructure-readonly' \
    SWAMP_ACCOUNT='ZZZZZZZZZ1' \
    SWAMP_ACCOUNT_NAME='infrastructure' \
    SWAMP_TARGET_ROLE='readonly' \
    swamp -region eu-central-1 -profile default -mfa-device arn:aws:iam::AAAAAAAAA:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/default' -account 'ZZZZZZZZZ1' -target-role 'readonly' -target-profile 'team1-infrastructure-readonly' -exec "cd '${1}' && terraform init"
}

function swamp-team1-infrastructure-developer() {
  SWAMP_TARGET_PROFILE='team1-infrastructure-developer' \
    SWAMP_ACCOUNT='ZZZZZZZZZ1' \
    SWAMP_ACCOUNT_NAME='infrastructure' \
    SWAMP_TARGET_ROLE='developer' \
    swamp -region eu-central-1 -profile default -mfa-device arn:aws:iam::AAAAAAAAA:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/default' -account 'ZZZZZZZZZ1' -target-role 'developer' -target-profile 'team1-infrastructure-developer' "${@}"
}

function swamp-team1-infrastructure-developer-bash() {
  SWAMP_TARGET_PROFILE='team1-infrastructure-developer' \
    SWAMP_ACCOUNT='ZZZZZZZZZ1' \
    SWAMP_ACCOUNT_NAME='infrastructure' \
    SWAMP_TARGET_ROLE='developer' \
    swamp -region eu-central-1 -profile default -mfa-device arn:aws:iam::AAAAAAAAA:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/default' -account 'ZZZZZZZZZ1' -target-role 'developer' -target-profile 'team1-infrastructure-developer' -exec "bash"
}

function swamp-team1-infrastructure-developer-info() {
  SWAMP_TARGET_PROFILE='team1-infrastructure-developer' \
    SWAMP_ACCOUNT='ZZZZZZZZZ1' \
    SWAMP_ACCOUNT_NAME='infrastructure' \
    SWAMP_TARGET_ROLE='developer' \
    swamp -region eu-central-1 -profile default -mfa-device arn:aws:iam::AAAAAAAAA:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/default' -account 'ZZZZZZZZZ1' -target-role 'developer' -target-profile 'team1-infrastructure-developer' -exec "aws sts get-caller-identity --output json"
}

function swamp-team1-infrastructure-developer-tf-init() {
  SWAMP_TARGET_PROFILE='team1-infrastructure-developer' \
    SWAMP_ACCOUNT='ZZZZZZZZZ1' \
    SWAMP_ACCOUNT_NAME='infrastructure' \
    SWAMP_TARGET_ROLE='developer' \
    swamp -region eu-central-1 -profile default -mfa-device arn:aws:iam::AAAAAAAAA:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/default' -account 'ZZZZZZZZZ1' -target-role 'developer' -target-profile 'team1-infrastructure-developer' -exec "cd '${1}' && terraform init"
}

function swamp-team2-nonlive-admin() {
  SWAMP_TARGET_PROFILE='team2-nonlive-admin' \
    SWAMP_ACCOUNT='XXXXXXXXX2' \
    SWAMP_ACCOUNT_NAME='nonlive' \
    SWAMP_TARGET_ROLE='admin' \
    swamp -region eu-central-1 -profile default -mfa-device arn:aws:iam::AAAAAAAAA:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/default' -account 'XXXXXXXXX2' -target-role 'admin' -target-profile 'team2-nonlive-admin' "${@}"
}

function swamp-team2-nonlive-admin-bash() {
  SWAMP_TARGET_PROFILE='team2-nonlive-admin' \
    SWAMP_ACCOUNT='XXXXXXXXX2' \
    SWAMP_ACCOUNT_NAME='nonlive' \
    SWAMP_TARGET_ROLE='admin' \
    swamp -region eu-central-1 -profile default -mfa-device arn:aws:iam::AAAAAAAAA:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/default' -account 'XXXXXXXXX2' -target-role 'admin' -target-profile 'team2-nonlive-admin' -exec "bash"
}

function swamp-team2-nonlive-admin-info() {
  SWAMP_TARGET_PROFILE='team2-nonlive-admin' \
    SWAMP_ACCOUNT='XXXXXXXXX2' \
    SWAMP_ACCOUNT_NAME='nonlive' \
    SWAMP_TARGET_ROLE='admin' \
    swamp -region eu-central-1 -profile default -mfa-device arn:aws:iam::AAAAAAAAA:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/default' -account 'XXXXXXXXX2' -target-role 'admin' -target-profile 'team2-nonlive-admin' -exec "aws sts get-caller-identity --output json"
}

function swamp-team2-nonlive-admin-tf-init() {
  SWAMP_TARGET_PROFILE='team2-nonlive-admin' \
    SWAMP_ACCOUNT='XXXXXXXXX2' \
    SWAMP_ACCOUNT_NAME='nonlive' \
    SWAMP_TARGET_ROLE='admin' \
    swamp -region eu-central-1 -profile default -mfa-device arn:aws:iam::AAAAAAAAA:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/default' -account 'XXXXXXXXX2' -target-role 'admin' -target-profile 'team2-nonlive-admin' -exec "cd '${1}' && terraform init"
}

function swamp-team2-live-readonly() {
  SWAMP_TARGET_PROFILE='team2-live-readonly' \
    SWAMP_ACCOUNT='YYYYYYYYY2' \
    SWAMP_ACCOUNT_NAME='live' \
    SWAMP_TARGET_ROLE='readonly' \
    swamp -region eu-central-1 -profile default -mfa-device arn:aws:iam::AAAAAAAAA:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/default' -account 'YYYYYYYYY2' -target-role 'readonly' -target-profile 'team2-live-readonly' "${@}"
}

function swamp-team2-live-readonly-bash() {
  SWAMP_TARGET_PROFILE='team2-live-readonly' \
    SWAMP_ACCOUNT='YYYYYYYYY2' \
    SWAMP_ACCOUNT_NAME='live' \
    SWAMP_TARGET_ROLE='readonly' \
    swamp -region eu-central-1 -profile default -mfa-device arn:aws:iam::AAAAAAAAA:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/default' -account 'YYYYYYYYY2' -target-role 'readonly' -target-profile 'team2-live-readonly' -exec "bash"
}

function swamp-team2-live-readonly-info() {
  SWAMP_TARGET_PROFILE='team2-live-readonly' \
    SWAMP_ACCOUNT='YYYYYYYYY2' \
    SWAMP_ACCOUNT_NAME='live' \
    SWAMP_TARGET_ROLE='readonly' \
    swamp -region eu-central-1 -profile default -mfa-device arn:aws:iam::AAAAAAAAA:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/default' -account 'YYYYYYYYY2' -target-role 'readonly' -target-profile 'team2-live-readonly' -exec "aws sts get-caller-identity --output json"
}

function swamp-team2-live-readonly-tf-init() {
  SWAMP_TARGET_PROFILE='team2-live-readonly' \
    SWAMP_ACCOUNT='YYYYYYYYY2' \
    SWAMP_ACCOUNT_NAME='live' \
    SWAMP_TARGET_ROLE='readonly' \
    swamp -region eu-central-1 -profile default -mfa-device arn:aws:iam::AAAAAAAAA:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/default' -account 'YYYYYYYYY2' -target-role 'readonly' -target-profile 'team2-live-readonly' -exec "cd '${1}' && terraform init"
}

function swamp-team2-infrastructure-readonly() {
  SWAMP_TARGET_PROFILE='team2-infrastructure-readonly' \
    SWAMP_ACCOUNT='ZZZZZZZZZ2' \
    SWAMP_ACCOUNT_NAME='infrastructure' \
    SWAMP_TARGET_ROLE='readonly' \
    swamp -region eu-central-1 -profile default -mfa-device arn:aws:iam::AAAAAAAAA:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/default' -account 'ZZZZZZZZZ2' -target-role 'readonly' -target-profile 'team2-infrastructure-readonly' "${@}"
}

function swamp-team2-infrastructure-readonly-bash() {
  SWAMP_TARGET_PROFILE='team2-infrastructure-readonly' \
    SWAMP_ACCOUNT='ZZZZZZZZZ2' \
    SWAMP_ACCOUNT_NAME='infrastructure' \
    SWAMP_TARGET_ROLE='readonly' \
    swamp -region eu-central-1 -profile default -mfa-device arn:aws:iam::AAAAAAAAA:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/default' -account 'ZZZZZZZZZ2' -target-role 'readonly' -target-profile 'team2-infrastructure-readonly' -exec "bash"
}

function swamp-team2-infrastructure-readonly-info() {
  SWAMP_TARGET_PROFILE='team2-infrastructure-readonly' \
    SWAMP_ACCOUNT='ZZZZZZZZZ2' \
    SWAMP_ACCOUNT_NAME='infrastructure' \
    SWAMP_TARGET_ROLE='readonly' \
    swamp -region eu-central-1 -profile default -mfa-device arn:aws:iam::AAAAAAAAA:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/default' -account 'ZZZZZZZZZ2' -target-role 'readonly' -target-profile 'team2-infrastructure-readonly' -exec "aws sts get-caller-identity --output json"
}

function swamp-team2-infrastructure-readonly-tf-init() {
  SWAMP_TARGET_PROFILE='team2-infrastructure-readonly' \
    SWAMP_ACCOUNT='ZZZZZZZZZ2' \
    SWAMP_ACCOUNT_NAME='infrastructure' \
    SWAMP_TARGET_ROLE='readonly' \
    swamp -region eu-central-1 -profile default -mfa-device arn:aws:iam::AAAAAAAAA:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/default' -account 'ZZZZZZZZZ2' -target-role 'readonly' -target-profile 'team2-infrastructure-readonly' -exec "cd '${1}' && terraform init"
}

function swamp-team3-nonlive-users-developer() {
  SWAMP_TARGET_PROFILE='team3-nonlive-users-developer' \
    SWAMP_ACCOUNT='XXXXXXXXXXX3' \
    SWAMP_ACCOUNT_NAME='nonlive' \
    SWAMP_TARGET_ROLE='users/Developer' \
    swamp -region eu-central-1 -profile team3 -intermediate-profile team3-session -mfa-device arn:aws:iam::CCCCCCCCCC:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/team3' -account 'XXXXXXXXXXX3' -target-role 'users/Developer' -target-profile 'team3-nonlive-users-developer' "${@}"
}

function swamp-team3-nonlive-users-developer-bash() {
  SWAMP_TARGET_PROFILE='team3-nonlive-users-developer' \
    SWAMP_ACCOUNT='XXXXXXXXXXX3' \
    SWAMP_ACCOUNT_NAME='nonlive' \
    SWAMP_TARGET_ROLE='users/Developer' \
    swamp -region eu-central-1 -profile team3 -intermediate-profile team3-session -mfa-device arn:aws:iam::CCCCCCCCCC:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/team3' -account 'XXXXXXXXXXX3' -target-role 'users/Developer' -target-profile 'team3-nonlive-users-developer' -exec "bash"
}

function swamp-team3-nonlive-users-developer-info() {
  SWAMP_TARGET_PROFILE='team3-nonlive-users-developer' \
    SWAMP_ACCOUNT='XXXXXXXXXXX3' \
    SWAMP_ACCOUNT_NAME='nonlive' \
    SWAMP_TARGET_ROLE='users/Developer' \
    swamp -region eu-central-1 -profile team3 -intermediate-profile team3-session -mfa-device arn:aws:iam::CCCCCCCCCC:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/team3' -account 'XXXXXXXXXXX3' -target-role 'users/Developer' -target-profile 'team3-nonlive-users-developer' -exec "aws sts get-caller-identity --output json"
}

function swamp-team3-nonlive-users-developer-tf-init() {
  SWAMP_TARGET_PROFILE='team3-nonlive-users-developer' \
    SWAMP_ACCOUNT='XXXXXXXXXXX3' \
    SWAMP_ACCOUNT_NAME='nonlive' \
    SWAMP_TARGET_ROLE='users/Developer' \
    swamp -region eu-central-1 -profile team3 -intermediate-profile team3-session -mfa-device arn:aws:iam::CCCCCCCCCC:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/team3' -account 'XXXXXXXXXXX3' -target-role 'users/Developer' -target-profile 'team3-nonlive-users-developer' -exec "cd '${1}' && terraform init"
}

function swamp-team3-nonlive-users-developer-build() {
  SWAMP_TARGET_PROFILE='team3-nonlive-users-developer' \
    SWAMP_ACCOUNT='XXXXXXXXXXX3' \
    SWAMP_ACCOUNT_NAME='nonlive' \
    SWAMP_TARGET_ROLE='users/Developer' \
    swamp -region eu-central-1 -profile team3 -intermediate-profile team3-session -mfa-device arn:aws:iam::CCCCCCCCCC:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/team3' -account 'XXXXXXXXXXX3' -target-role 'users/Developer' -target-profile 'team3-nonlive-users-developer' -exec "./ci/build.sh"
}

function swamp-team3-nonlive-users-developer-deploy() {
  SWAMP_TARGET_PROFILE='team3-nonlive-users-developer' \
    SWAMP_ACCOUNT='XXXXXXXXXXX3' \
    SWAMP_ACCOUNT_NAME='nonlive' \
    SWAMP_TARGET_ROLE='users/Developer' \
    swamp -region eu-central-1 -profile team3 -intermediate-profile team3-session -mfa-device arn:aws:iam::CCCCCCCCCC:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/team3' -account 'XXXXXXXXXXX3' -target-role 'users/Developer' -target-profile 'team3-nonlive-users-developer' -exec "./ci/deploy.sh \${SWAMP_ACCOUNT_NAME}"
}

function swamp-team3-nonlive-users-developer-tf-plan() {
  SWAMP_TARGET_PROFILE='team3-nonlive-users-developer' \
    SWAMP_ACCOUNT='XXXXXXXXXXX3' \
    SWAMP_ACCOUNT_NAME='nonlive' \
    SWAMP_TARGET_ROLE='users/Developer' \
    swamp -region eu-central-1 -profile team3 -intermediate-profile team3-session -mfa-device arn:aws:iam::CCCCCCCCCC:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/team3' -account 'XXXXXXXXXXX3' -target-role 'users/Developer' -target-profile 'team3-nonlive-users-developer' -exec "cd '${1}' && terraform workspace select \${SWAMP_ACCOUNT_NAME} && terraform plan"
}

function swamp-team3-nonlive-users-admin() {
  SWAMP_TARGET_PROFILE='team3-nonlive-users-admin' \
    SWAMP_ACCOUNT='XXXXXXXXXXX3' \
    SWAMP_ACCOUNT_NAME='nonlive' \
    SWAMP_TARGET_ROLE='users/Admin' \
    swamp -region eu-central-1 -profile team3 -intermediate-profile team3-session -mfa-device arn:aws:iam::CCCCCCCCCC:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/team3' -account 'XXXXXXXXXXX3' -target-role 'users/Admin' -target-profile 'team3-nonlive-users-admin' "${@}"
}

function swamp-team3-nonlive-users-admin-bash() {
  SWAMP_TARGET_PROFILE='team3-nonlive-users-admin' \
    SWAMP_ACCOUNT='XXXXXXXXXXX3' \
    SWAMP_ACCOUNT_NAME='nonlive' \
    SWAMP_TARGET_ROLE='users/Admin' \
    swamp -region eu-central-1 -profile team3 -intermediate-profile team3-session -mfa-device arn:aws:iam::CCCCCCCCCC:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/team3' -account 'XXXXXXXXXXX3' -target-role 'users/Admin' -target-profile 'team3-nonlive-users-admin' -exec "bash"
}

function swamp-team3-nonlive-users-admin-info() {
  SWAMP_TARGET_PROFILE='team3-nonlive-users-admin' \
    SWAMP_ACCOUNT='XXXXXXXXXXX3' \
    SWAMP_ACCOUNT_NAME='nonlive' \
    SWAMP_TARGET_ROLE='users/Admin' \
    swamp -region eu-central-1 -profile team3 -intermediate-profile team3-session -mfa-device arn:aws:iam::CCCCCCCCCC:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/team3' -account 'XXXXXXXXXXX3' -target-role 'users/Admin' -target-profile 'team3-nonlive-users-admin' -exec "aws sts get-caller-identity --output json"
}

function swamp-team3-nonlive-users-admin-tf-init() {
  SWAMP_TARGET_PROFILE='team3-nonlive-users-admin' \
    SWAMP_ACCOUNT='XXXXXXXXXXX3' \
    SWAMP_ACCOUNT_NAME='nonlive' \
    SWAMP_TARGET_ROLE='users/Admin' \
    swamp -region eu-central-1 -profile team3 -intermediate-profile team3-session -mfa-device arn:aws:iam::CCCCCCCCCC:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/team3' -account 'XXXXXXXXXXX3' -target-role 'users/Admin' -target-profile 'team3-nonlive-users-admin' -exec "cd '${1}' && terraform init"
}

function swamp-team3-nonlive-users-admin-build() {
  SWAMP_TARGET_PROFILE='team3-nonlive-users-admin' \
    SWAMP_ACCOUNT='XXXXXXXXXXX3' \
    SWAMP_ACCOUNT_NAME='nonlive' \
    SWAMP_TARGET_ROLE='users/Admin' \
    swamp -region eu-central-1 -profile team3 -intermediate-profile team3-session -mfa-device arn:aws:iam::CCCCCCCCCC:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/team3' -account 'XXXXXXXXXXX3' -target-role 'users/Admin' -target-profile 'team3-nonlive-users-admin' -exec "./ci/build.sh"
}

function swamp-team3-nonlive-users-admin-deploy() {
  SWAMP_TARGET_PROFILE='team3-nonlive-users-admin' \
    SWAMP_ACCOUNT='XXXXXXXXXXX3' \
    SWAMP_ACCOUNT_NAME='nonlive' \
    SWAMP_TARGET_ROLE='users/Admin' \
    swamp -region eu-central-1 -profile team3 -intermediate-profile team3-session -mfa-device arn:aws:iam::CCCCCCCCCC:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/team3' -account 'XXXXXXXXXXX3' -target-role 'users/Admin' -target-profile 'team3-nonlive-users-admin' -exec "./ci/deploy.sh \${SWAMP_ACCOUNT_NAME}"
}

function swamp-team3-nonlive-users-admin-tf-plan() {
  SWAMP_TARGET_PROFILE='team3-nonlive-users-admin' \
    SWAMP_ACCOUNT='XXXXXXXXXXX3' \
    SWAMP_ACCOUNT_NAME='nonlive' \
    SWAMP_TARGET_ROLE='users/Admin' \
    swamp -region eu-central-1 -profile team3 -intermediate-profile team3-session -mfa-device arn:aws:iam::CCCCCCCCCC:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/team3' -account 'XXXXXXXXXXX3' -target-role 'users/Admin' -target-profile 'team3-nonlive-users-admin' -exec "cd '${1}' && terraform workspace select \${SWAMP_ACCOUNT_NAME} && terraform plan"
}

function swamp-team3-live-users-developer() {
  SWAMP_TARGET_PROFILE='team3-live-users-developer' \
    SWAMP_ACCOUNT='ZZZZZZZZZZZ3' \
    SWAMP_ACCOUNT_NAME='live' \
    SWAMP_TARGET_ROLE='users/Developer' \
    swamp -region eu-central-1 -profile team3 -intermediate-profile team3-session -mfa-device arn:aws:iam::CCCCCCCCCC:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/team3' -account 'ZZZZZZZZZZZ3' -target-role 'users/Developer' -target-profile 'team3-live-users-developer' "${@}"
}

function swamp-team3-live-users-developer-bash() {
  SWAMP_TARGET_PROFILE='team3-live-users-developer' \
    SWAMP_ACCOUNT='ZZZZZZZZZZZ3' \
    SWAMP_ACCOUNT_NAME='live' \
    SWAMP_TARGET_ROLE='users/Developer' \
    swamp -region eu-central-1 -profile team3 -intermediate-profile team3-session -mfa-device arn:aws:iam::CCCCCCCCCC:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/team3' -account 'ZZZZZZZZZZZ3' -target-role 'users/Developer' -target-profile 'team3-live-users-developer' -exec "bash"
}

function swamp-team3-live-users-developer-info() {
  SWAMP_TARGET_PROFILE='team3-live-users-developer' \
    SWAMP_ACCOUNT='ZZZZZZZZZZZ3' \
    SWAMP_ACCOUNT_NAME='live' \
    SWAMP_TARGET_ROLE='users/Developer' \
    swamp -region eu-central-1 -profile team3 -intermediate-profile team3-session -mfa-device arn:aws:iam::CCCCCCCCCC:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/team3' -account 'ZZZZZZZZZZZ3' -target-role 'users/Developer' -target-profile 'team3-live-users-developer' -exec "aws sts get-caller-identity --output json"
}

function swamp-team3-live-users-developer-tf-init() {
  SWAMP_TARGET_PROFILE='team3-live-users-developer' \
    SWAMP_ACCOUNT='ZZZZZZZZZZZ3' \
    SWAMP_ACCOUNT_NAME='live' \
    SWAMP_TARGET_ROLE='users/Developer' \
    swamp -region eu-central-1 -profile team3 -intermediate-profile team3-session -mfa-device arn:aws:iam::CCCCCCCCCC:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/team3' -account 'ZZZZZZZZZZZ3' -target-role 'users/Developer' -target-profile 'team3-live-users-developer' -exec "cd '${1}' && terraform init"
}

function swamp-team3-live-users-developer-deploy() {
  SWAMP_TARGET_PROFILE='team3-live-users-developer' \
    SWAMP_ACCOUNT='ZZZZZZZZZZZ3' \
    SWAMP_ACCOUNT_NAME='live' \
    SWAMP_TARGET_ROLE='users/Developer' \
    swamp -region eu-central-1 -profile team3 -intermediate-profile team3-session -mfa-device arn:aws:iam::CCCCCCCCCC:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/team3' -account 'ZZZZZZZZZZZ3' -target-role 'users/Developer' -target-profile 'team3-live-users-developer' -exec "./ci/deploy.sh \${SWAMP_ACCOUNT_NAME}"
}

function swamp-team3-live-users-developer-tf-plan() {
  SWAMP_TARGET_PROFILE='team3-live-users-developer' \
    SWAMP_ACCOUNT='ZZZZZZZZZZZ3' \
    SWAMP_ACCOUNT_NAME='live' \
    SWAMP_TARGET_ROLE='users/Developer' \
    swamp -region eu-central-1 -profile team3 -intermediate-profile team3-session -mfa-device arn:aws:iam::CCCCCCCCCC:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/team3' -account 'ZZZZZZZZZZZ3' -target-role 'users/Developer' -target-profile 'team3-live-users-developer' -exec "cd '${1}' && terraform workspace select \${SWAMP_ACCOUNT_NAME} && terraform plan"
}

function swamp-team3-live-users-admin() {
  SWAMP_TARGET_PROFILE='team3-live-users-admin' \
    SWAMP_ACCOUNT='ZZZZZZZZZZZ3' \
    SWAMP_ACCOUNT_NAME='live' \
    SWAMP_TARGET_ROLE='users/Admin' \
    swamp -region eu-central-1 -profile team3 -intermediate-profile team3-session -mfa-device arn:aws:iam::CCCCCCCCCC:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/team3' -account 'ZZZZZZZZZZZ3' -target-role 'users/Admin' -target-profile 'team3-live-users-admin' "${@}"
}

function swamp-team3-live-users-admin-bash() {
  SWAMP_TARGET_PROFILE='team3-live-users-admin' \
    SWAMP_ACCOUNT='ZZZZZZZZZZZ3' \
    SWAMP_ACCOUNT_NAME='live' \
    SWAMP_TARGET_ROLE='users/Admin' \
    swamp -region eu-central-1 -profile team3 -intermediate-profile team3-session -mfa-device arn:aws:iam::CCCCCCCCCC:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/team3' -account 'ZZZZZZZZZZZ3' -target-role 'users/Admin' -target-profile 'team3-live-users-admin' -exec "bash"
}

function swamp-team3-live-users-admin-info() {
  SWAMP_TARGET_PROFILE='team3-live-users-admin' \
    SWAMP_ACCOUNT='ZZZZZZZZZZZ3' \
    SWAMP_ACCOUNT_NAME='live' \
    SWAMP_TARGET_ROLE='users/Admin' \
    swamp -region eu-central-1 -profile team3 -intermediate-profile team3-session -mfa-device arn:aws:iam::CCCCCCCCCC:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/team3' -account 'ZZZZZZZZZZZ3' -target-role 'users/Admin' -target-profile 'team3-live-users-admin' -exec "aws sts get-caller-identity --output json"
}

function swamp-team3-live-users-admin-tf-init() {
  SWAMP_TARGET_PROFILE='team3-live-users-admin' \
    SWAMP_ACCOUNT='ZZZZZZZZZZZ3' \
    SWAMP_ACCOUNT_NAME='live' \
    SWAMP_TARGET_ROLE='users/Admin' \
    swamp -region eu-central-1 -profile team3 -intermediate-profile team3-session -mfa-device arn:aws:iam::CCCCCCCCCC:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/team3' -account 'ZZZZZZZZZZZ3' -target-role 'users/Admin' -target-profile 'team3-live-users-admin' -exec "cd '${1}' && terraform init"
}

function swamp-team3-live-users-admin-deploy() {
  SWAMP_TARGET_PROFILE='team3-live-users-admin' \
    SWAMP_ACCOUNT='ZZZZZZZZZZZ3' \
    SWAMP_ACCOUNT_NAME='live' \
    SWAMP_TARGET_ROLE='users/Admin' \
    swamp -region eu-central-1 -profile team3 -intermediate-profile team3-session -mfa-device arn:aws:iam::CCCCCCCCCC:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/team3' -account 'ZZZZZZZZZZZ3' -target-role 'users/Admin' -target-profile 'team3-live-users-admin' -exec "./ci/deploy.sh \${SWAMP_ACCOUNT_NAME}"
}

function swamp-team3-live-users-admin-tf-plan() {
  SWAMP_TARGET_PROFILE='team3-live-users-admin' \
    SWAMP_ACCOUNT='ZZZZZZZZZZZ3' \
    SWAMP_ACCOUNT_NAME='live' \
    SWAMP_TARGET_ROLE='users/Admin' \
    swamp -region eu-central-1 -profile team3 -intermediate-profile team3-session -mfa-device arn:aws:iam::CCCCCCCCCC:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/team3' -account 'ZZZZZZZZZZZ3' -target-role 'users/Admin' -target-profile 'team3-live-users-admin' -exec "cd '${1}' && terraform workspace select \${SWAMP_ACCOUNT_NAME} && terraform plan"
}
