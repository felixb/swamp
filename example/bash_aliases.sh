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

function swamp-team3-nonlive-developer() {
  SWAMP_TARGET_PROFILE='team3-nonlive-developer' \
    SWAMP_ACCOUNT='XXXXXXXXXXX3' \
    SWAMP_ACCOUNT_NAME='nonlive' \
    SWAMP_TARGET_ROLE='developer' \
    swamp -region eu-central-1 -profile team3 -intermediate-profile team3-session -mfa-device arn:aws:iam::CCCCCCCCCC:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/team3' -account 'XXXXXXXXXXX3' -target-role 'developer' -target-profile 'team3-nonlive-developer' "${@}"
}

function swamp-team3-nonlive-developer-bash() {
  SWAMP_TARGET_PROFILE='team3-nonlive-developer' \
    SWAMP_ACCOUNT='XXXXXXXXXXX3' \
    SWAMP_ACCOUNT_NAME='nonlive' \
    SWAMP_TARGET_ROLE='developer' \
    swamp -region eu-central-1 -profile team3 -intermediate-profile team3-session -mfa-device arn:aws:iam::CCCCCCCCCC:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/team3' -account 'XXXXXXXXXXX3' -target-role 'developer' -target-profile 'team3-nonlive-developer' -exec "bash"
}

function swamp-team3-nonlive-developer-info() {
  SWAMP_TARGET_PROFILE='team3-nonlive-developer' \
    SWAMP_ACCOUNT='XXXXXXXXXXX3' \
    SWAMP_ACCOUNT_NAME='nonlive' \
    SWAMP_TARGET_ROLE='developer' \
    swamp -region eu-central-1 -profile team3 -intermediate-profile team3-session -mfa-device arn:aws:iam::CCCCCCCCCC:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/team3' -account 'XXXXXXXXXXX3' -target-role 'developer' -target-profile 'team3-nonlive-developer' -exec "aws sts get-caller-identity --output json"
}

function swamp-team3-nonlive-developer-tf-init() {
  SWAMP_TARGET_PROFILE='team3-nonlive-developer' \
    SWAMP_ACCOUNT='XXXXXXXXXXX3' \
    SWAMP_ACCOUNT_NAME='nonlive' \
    SWAMP_TARGET_ROLE='developer' \
    swamp -region eu-central-1 -profile team3 -intermediate-profile team3-session -mfa-device arn:aws:iam::CCCCCCCCCC:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/team3' -account 'XXXXXXXXXXX3' -target-role 'developer' -target-profile 'team3-nonlive-developer' -exec "cd '${1}' && terraform init"
}

function swamp-team3-nonlive-developer-build() {
  SWAMP_TARGET_PROFILE='team3-nonlive-developer' \
    SWAMP_ACCOUNT='XXXXXXXXXXX3' \
    SWAMP_ACCOUNT_NAME='nonlive' \
    SWAMP_TARGET_ROLE='developer' \
    swamp -region eu-central-1 -profile team3 -intermediate-profile team3-session -mfa-device arn:aws:iam::CCCCCCCCCC:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/team3' -account 'XXXXXXXXXXX3' -target-role 'developer' -target-profile 'team3-nonlive-developer' -exec "./ci/build.sh"
}

function swamp-team3-nonlive-developer-deploy() {
  SWAMP_TARGET_PROFILE='team3-nonlive-developer' \
    SWAMP_ACCOUNT='XXXXXXXXXXX3' \
    SWAMP_ACCOUNT_NAME='nonlive' \
    SWAMP_TARGET_ROLE='developer' \
    swamp -region eu-central-1 -profile team3 -intermediate-profile team3-session -mfa-device arn:aws:iam::CCCCCCCCCC:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/team3' -account 'XXXXXXXXXXX3' -target-role 'developer' -target-profile 'team3-nonlive-developer' -exec "./ci/deploy.sh \${SWAMP_ACCOUNT_NAME}"
}

function swamp-team3-nonlive-developer-tf-plan() {
  SWAMP_TARGET_PROFILE='team3-nonlive-developer' \
    SWAMP_ACCOUNT='XXXXXXXXXXX3' \
    SWAMP_ACCOUNT_NAME='nonlive' \
    SWAMP_TARGET_ROLE='developer' \
    swamp -region eu-central-1 -profile team3 -intermediate-profile team3-session -mfa-device arn:aws:iam::CCCCCCCCCC:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/team3' -account 'XXXXXXXXXXX3' -target-role 'developer' -target-profile 'team3-nonlive-developer' -exec "cd '${1}' && terraform workspace select \${SWAMP_ACCOUNT_NAME} && terraform plan"
}

function swamp-team3-nonlive-admin() {
  SWAMP_TARGET_PROFILE='team3-nonlive-admin' \
    SWAMP_ACCOUNT='XXXXXXXXXXX3' \
    SWAMP_ACCOUNT_NAME='nonlive' \
    SWAMP_TARGET_ROLE='admin' \
    swamp -region eu-central-1 -profile team3 -intermediate-profile team3-session -mfa-device arn:aws:iam::CCCCCCCCCC:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/team3' -account 'XXXXXXXXXXX3' -target-role 'admin' -target-profile 'team3-nonlive-admin' "${@}"
}

function swamp-team3-nonlive-admin-bash() {
  SWAMP_TARGET_PROFILE='team3-nonlive-admin' \
    SWAMP_ACCOUNT='XXXXXXXXXXX3' \
    SWAMP_ACCOUNT_NAME='nonlive' \
    SWAMP_TARGET_ROLE='admin' \
    swamp -region eu-central-1 -profile team3 -intermediate-profile team3-session -mfa-device arn:aws:iam::CCCCCCCCCC:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/team3' -account 'XXXXXXXXXXX3' -target-role 'admin' -target-profile 'team3-nonlive-admin' -exec "bash"
}

function swamp-team3-nonlive-admin-info() {
  SWAMP_TARGET_PROFILE='team3-nonlive-admin' \
    SWAMP_ACCOUNT='XXXXXXXXXXX3' \
    SWAMP_ACCOUNT_NAME='nonlive' \
    SWAMP_TARGET_ROLE='admin' \
    swamp -region eu-central-1 -profile team3 -intermediate-profile team3-session -mfa-device arn:aws:iam::CCCCCCCCCC:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/team3' -account 'XXXXXXXXXXX3' -target-role 'admin' -target-profile 'team3-nonlive-admin' -exec "aws sts get-caller-identity --output json"
}

function swamp-team3-nonlive-admin-tf-init() {
  SWAMP_TARGET_PROFILE='team3-nonlive-admin' \
    SWAMP_ACCOUNT='XXXXXXXXXXX3' \
    SWAMP_ACCOUNT_NAME='nonlive' \
    SWAMP_TARGET_ROLE='admin' \
    swamp -region eu-central-1 -profile team3 -intermediate-profile team3-session -mfa-device arn:aws:iam::CCCCCCCCCC:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/team3' -account 'XXXXXXXXXXX3' -target-role 'admin' -target-profile 'team3-nonlive-admin' -exec "cd '${1}' && terraform init"
}

function swamp-team3-nonlive-admin-build() {
  SWAMP_TARGET_PROFILE='team3-nonlive-admin' \
    SWAMP_ACCOUNT='XXXXXXXXXXX3' \
    SWAMP_ACCOUNT_NAME='nonlive' \
    SWAMP_TARGET_ROLE='admin' \
    swamp -region eu-central-1 -profile team3 -intermediate-profile team3-session -mfa-device arn:aws:iam::CCCCCCCCCC:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/team3' -account 'XXXXXXXXXXX3' -target-role 'admin' -target-profile 'team3-nonlive-admin' -exec "./ci/build.sh"
}

function swamp-team3-nonlive-admin-deploy() {
  SWAMP_TARGET_PROFILE='team3-nonlive-admin' \
    SWAMP_ACCOUNT='XXXXXXXXXXX3' \
    SWAMP_ACCOUNT_NAME='nonlive' \
    SWAMP_TARGET_ROLE='admin' \
    swamp -region eu-central-1 -profile team3 -intermediate-profile team3-session -mfa-device arn:aws:iam::CCCCCCCCCC:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/team3' -account 'XXXXXXXXXXX3' -target-role 'admin' -target-profile 'team3-nonlive-admin' -exec "./ci/deploy.sh \${SWAMP_ACCOUNT_NAME}"
}

function swamp-team3-nonlive-admin-tf-plan() {
  SWAMP_TARGET_PROFILE='team3-nonlive-admin' \
    SWAMP_ACCOUNT='XXXXXXXXXXX3' \
    SWAMP_ACCOUNT_NAME='nonlive' \
    SWAMP_TARGET_ROLE='admin' \
    swamp -region eu-central-1 -profile team3 -intermediate-profile team3-session -mfa-device arn:aws:iam::CCCCCCCCCC:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/team3' -account 'XXXXXXXXXXX3' -target-role 'admin' -target-profile 'team3-nonlive-admin' -exec "cd '${1}' && terraform workspace select \${SWAMP_ACCOUNT_NAME} && terraform plan"
}

function swamp-team3-live-developer() {
  SWAMP_TARGET_PROFILE='team3-live-developer' \
    SWAMP_ACCOUNT='ZZZZZZZZZZZ3' \
    SWAMP_ACCOUNT_NAME='live' \
    SWAMP_TARGET_ROLE='developer' \
    swamp -region eu-central-1 -profile team3 -intermediate-profile team3-session -mfa-device arn:aws:iam::CCCCCCCCCC:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/team3' -account 'ZZZZZZZZZZZ3' -target-role 'developer' -target-profile 'team3-live-developer' "${@}"
}

function swamp-team3-live-developer-bash() {
  SWAMP_TARGET_PROFILE='team3-live-developer' \
    SWAMP_ACCOUNT='ZZZZZZZZZZZ3' \
    SWAMP_ACCOUNT_NAME='live' \
    SWAMP_TARGET_ROLE='developer' \
    swamp -region eu-central-1 -profile team3 -intermediate-profile team3-session -mfa-device arn:aws:iam::CCCCCCCCCC:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/team3' -account 'ZZZZZZZZZZZ3' -target-role 'developer' -target-profile 'team3-live-developer' -exec "bash"
}

function swamp-team3-live-developer-info() {
  SWAMP_TARGET_PROFILE='team3-live-developer' \
    SWAMP_ACCOUNT='ZZZZZZZZZZZ3' \
    SWAMP_ACCOUNT_NAME='live' \
    SWAMP_TARGET_ROLE='developer' \
    swamp -region eu-central-1 -profile team3 -intermediate-profile team3-session -mfa-device arn:aws:iam::CCCCCCCCCC:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/team3' -account 'ZZZZZZZZZZZ3' -target-role 'developer' -target-profile 'team3-live-developer' -exec "aws sts get-caller-identity --output json"
}

function swamp-team3-live-developer-tf-init() {
  SWAMP_TARGET_PROFILE='team3-live-developer' \
    SWAMP_ACCOUNT='ZZZZZZZZZZZ3' \
    SWAMP_ACCOUNT_NAME='live' \
    SWAMP_TARGET_ROLE='developer' \
    swamp -region eu-central-1 -profile team3 -intermediate-profile team3-session -mfa-device arn:aws:iam::CCCCCCCCCC:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/team3' -account 'ZZZZZZZZZZZ3' -target-role 'developer' -target-profile 'team3-live-developer' -exec "cd '${1}' && terraform init"
}

function swamp-team3-live-developer-deploy() {
  SWAMP_TARGET_PROFILE='team3-live-developer' \
    SWAMP_ACCOUNT='ZZZZZZZZZZZ3' \
    SWAMP_ACCOUNT_NAME='live' \
    SWAMP_TARGET_ROLE='developer' \
    swamp -region eu-central-1 -profile team3 -intermediate-profile team3-session -mfa-device arn:aws:iam::CCCCCCCCCC:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/team3' -account 'ZZZZZZZZZZZ3' -target-role 'developer' -target-profile 'team3-live-developer' -exec "./ci/deploy.sh \${SWAMP_ACCOUNT_NAME}"
}

function swamp-team3-live-developer-tf-plan() {
  SWAMP_TARGET_PROFILE='team3-live-developer' \
    SWAMP_ACCOUNT='ZZZZZZZZZZZ3' \
    SWAMP_ACCOUNT_NAME='live' \
    SWAMP_TARGET_ROLE='developer' \
    swamp -region eu-central-1 -profile team3 -intermediate-profile team3-session -mfa-device arn:aws:iam::CCCCCCCCCC:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/team3' -account 'ZZZZZZZZZZZ3' -target-role 'developer' -target-profile 'team3-live-developer' -exec "cd '${1}' && terraform workspace select \${SWAMP_ACCOUNT_NAME} && terraform plan"
}

function swamp-team3-live-admin() {
  SWAMP_TARGET_PROFILE='team3-live-admin' \
    SWAMP_ACCOUNT='ZZZZZZZZZZZ3' \
    SWAMP_ACCOUNT_NAME='live' \
    SWAMP_TARGET_ROLE='admin' \
    swamp -region eu-central-1 -profile team3 -intermediate-profile team3-session -mfa-device arn:aws:iam::CCCCCCCCCC:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/team3' -account 'ZZZZZZZZZZZ3' -target-role 'admin' -target-profile 'team3-live-admin' "${@}"
}

function swamp-team3-live-admin-bash() {
  SWAMP_TARGET_PROFILE='team3-live-admin' \
    SWAMP_ACCOUNT='ZZZZZZZZZZZ3' \
    SWAMP_ACCOUNT_NAME='live' \
    SWAMP_TARGET_ROLE='admin' \
    swamp -region eu-central-1 -profile team3 -intermediate-profile team3-session -mfa-device arn:aws:iam::CCCCCCCCCC:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/team3' -account 'ZZZZZZZZZZZ3' -target-role 'admin' -target-profile 'team3-live-admin' -exec "bash"
}

function swamp-team3-live-admin-info() {
  SWAMP_TARGET_PROFILE='team3-live-admin' \
    SWAMP_ACCOUNT='ZZZZZZZZZZZ3' \
    SWAMP_ACCOUNT_NAME='live' \
    SWAMP_TARGET_ROLE='admin' \
    swamp -region eu-central-1 -profile team3 -intermediate-profile team3-session -mfa-device arn:aws:iam::CCCCCCCCCC:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/team3' -account 'ZZZZZZZZZZZ3' -target-role 'admin' -target-profile 'team3-live-admin' -exec "aws sts get-caller-identity --output json"
}

function swamp-team3-live-admin-tf-init() {
  SWAMP_TARGET_PROFILE='team3-live-admin' \
    SWAMP_ACCOUNT='ZZZZZZZZZZZ3' \
    SWAMP_ACCOUNT_NAME='live' \
    SWAMP_TARGET_ROLE='admin' \
    swamp -region eu-central-1 -profile team3 -intermediate-profile team3-session -mfa-device arn:aws:iam::CCCCCCCCCC:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/team3' -account 'ZZZZZZZZZZZ3' -target-role 'admin' -target-profile 'team3-live-admin' -exec "cd '${1}' && terraform init"
}

function swamp-team3-live-admin-deploy() {
  SWAMP_TARGET_PROFILE='team3-live-admin' \
    SWAMP_ACCOUNT='ZZZZZZZZZZZ3' \
    SWAMP_ACCOUNT_NAME='live' \
    SWAMP_TARGET_ROLE='admin' \
    swamp -region eu-central-1 -profile team3 -intermediate-profile team3-session -mfa-device arn:aws:iam::CCCCCCCCCC:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/team3' -account 'ZZZZZZZZZZZ3' -target-role 'admin' -target-profile 'team3-live-admin' -exec "./ci/deploy.sh \${SWAMP_ACCOUNT_NAME}"
}

function swamp-team3-live-admin-tf-plan() {
  SWAMP_TARGET_PROFILE='team3-live-admin' \
    SWAMP_ACCOUNT='ZZZZZZZZZZZ3' \
    SWAMP_ACCOUNT_NAME='live' \
    SWAMP_TARGET_ROLE='admin' \
    swamp -region eu-central-1 -profile team3 -intermediate-profile team3-session -mfa-device arn:aws:iam::CCCCCCCCCC:mfa/BBBBBBBB -mfa-exec 'pass otp aws.amazon.com/team3' -account 'ZZZZZZZZZZZ3' -target-role 'admin' -target-profile 'team3-live-admin' -exec "cd '${1}' && terraform workspace select \${SWAMP_ACCOUNT_NAME} && terraform plan"
}
