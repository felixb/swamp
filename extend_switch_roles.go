package main

import (
	"html/template"
	"io"
)

const (
	extendSwitchRolesBaseAccountTemplate = `
[{{.TeamName}}]
aws_account_id = {{.AccountName}}

`
)

const (
	extendSwitchRolesTemplate = `
[{{.AccountName}}]
source_profile = {{.SourceProfile}}
color = {{.Color}}
role_arn = arn:aws:iam::{{.AccountId}}:role/{{.Role}}

`
)

func generateExtendSwitchRolesBaseConfig(w io.Writer, team team) error {
	if tpl, err := template.New("aliases").Option("missingkey=error").Parse(extendSwitchRolesBaseAccountTemplate); err != nil {
		return err
	} else {
		t := templateVars{
			TeamName:   team.Name,
			AccountName: team.SwitchRoleAccount,
		}
		_ = tpl.Execute(w, t)
	}

	return nil
}

func generateExtendSwitchRolesConfigForAccount(w io.Writer, team team, account account, role string) error {
	if tpl, err := template.New("aliases").Option("missingkey=error").Parse(extendSwitchRolesTemplate); err != nil {
		return err
	} else {
		generateExtendSwitchRolesConfigForRole(w, team, account, role, tpl)
	}

	return nil
}

func generateExtendSwitchRolesConfigForRole(w io.Writer, team team, account account, role string, tpl *template.Template) {
	profileName := team.Name + "-" + account.Name + "-" + role

	t := templateVars{
		AccountId:     account.AccountId,
		AccountName:   profileName,
		Color:         account.Color,
		Role:          role,
		SourceProfile: team.Name,
	}
	_ = tpl.Execute(w, t)
}
