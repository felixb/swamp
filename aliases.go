package main

import (
	"fmt"
	"html/template"
	"io"
	"io/ioutil"
	"sort"

	"gopkg.in/yaml.v2"
)

type aliasConfig struct {
	AllArgs               string            `yaml:"allArgs"`
	AllExecs              map[string]string `yaml:"allExecs"`
	DefaultAdditionalArgs string            `yaml:"defaultAdditionalArgs"`
	Teams                 []team            `yaml:"teams"`
}

type team struct {
	Name              string    `yaml:"name"`
	AdditionalArgs    string    `yaml:"additionalArgs"`
	Accounts          []account `yaml:"accounts"`
	SwitchRoleAccount string    `yaml:"switchRoleAccount"`
}

type account struct {
	AccountId         string            `yaml:"accountId"`
	Color             string            `yaml:"color"`
	Name              string            `yaml:"name"`
	Roles             []string          `yaml:"roles"`
	Execs             map[string]string `yaml:"execs"`
}

type templateVars struct {
	AccountId     string
	AccountName   string
	AliasName     string
	Args          template.HTML
	Color         string
	ProfileName   string
	Role          string
	SourceProfile string
	TeamName      string
}

const (
	aliasTemplate = `
function swamp-{{.AliasName}}() {
  SWAMP_TARGET_PROFILE='{{.ProfileName}}'
  SWAMP_ACCOUNT='{{.AccountId}}'
  SWAMP_ACCOUNT_NAME='{{.AccountName}}'
  SWAMP_TARGET_ROLE='{{.Role}}'
  swamp {{.Args}}

  export AWS_PROFILE={{.ProfileName}}
}
`
)

func generateAliases(w io.Writer, path string, extendSwitchRoles string) error {
	var bytes []byte
	var err error
	if extendSwitchRoles != "" {
		_, _ = fmt.Fprintln(w, "# This extend switch roles config is generated with swamp")
		bytes, err = ioutil.ReadFile(extendSwitchRoles)
	} else {
		_, _ = fmt.Fprintln(w, "# This aliases are generated with swamp")
		bytes, err = ioutil.ReadFile(path)
	}

	c := &aliasConfig{}
	if err != nil {
		return err
	} else {
		if err := yaml.Unmarshal(bytes, c); err != nil {
			return err
		}

		for _, team := range c.Teams {
			if err := generateAliasTeam(w, c, team, extendSwitchRoles != ""); err != nil {
				return err
			}
		}
	}
	return nil
}

func generateAliasTeam(w io.Writer, config *aliasConfig, team team, extendSwitchRoles bool) error {
	if extendSwitchRoles {
		_ = generateExtendSwitchRolesBaseConfig(w, team)
	}

	for _, account := range team.Accounts {
		if err := generateAliasAccount(w, config, team, account, extendSwitchRoles); err != nil {
			return err
		}
	}

	return nil
}

func generateAliasAccount(w io.Writer, config *aliasConfig, team team, account account, extendSwitchRoles bool) error {
	if tpl, err := template.New("aliases").Option("missingkey=error").Parse(aliasTemplate); err != nil {
		return err
	} else {
		for _, role := range account.Roles {
			generateAliasRole(w, config, team, account, role, extendSwitchRoles, tpl)
		}
	}
	return nil
}

func generateAliasRole(w io.Writer, config *aliasConfig, team team, account account, role string, extendSwitchRoles bool, tpl *template.Template) {
	if extendSwitchRoles {
		_ = generateExtendSwitchRolesConfigForAccount(w, team, account, role)
		return
	}

	profileName := team.Name + "-" + account.Name + "-" + role
	args := config.AllArgs
	if team.AdditionalArgs != "" {
		args += " " + team.AdditionalArgs
	} else {
		args += " " + config.DefaultAdditionalArgs
	}
	args += " -account '" + account.AccountId + "'"
	args += " -target-role '" + role + "'"
	args += " -target-profile '" + profileName + "'"

	baseArgs := args

	t := templateVars{
		AccountId:   account.AccountId,
		AccountName: account.Name,
		AliasName:   profileName,
		Args:        template.HTML(baseArgs + ` "${@}"`),
		ProfileName: profileName,
		Role:        role,
		TeamName:    team.Name,
	}
	_ = tpl.Execute(w, t)
	generateExecs(w, baseArgs, profileName, tpl, t, config.AllExecs)
	generateExecs(w, baseArgs, profileName, tpl, t, account.Execs)


}

func generateExecs(w io.Writer, baseArgs string, profileName string, tpl *template.Template, t templateVars, execs map[string]string) {
	var keys []string
	for k := range execs {
		keys = append(keys, k)
	}
	sort.Strings(keys)

	for _, k := range keys {
		t.AliasName = profileName + "-" + k
		t.Args = template.HTML(baseArgs + ` -exec "` + execs[k] + `"`)
		_ = tpl.Execute(w, t)
	}
}
