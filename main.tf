terraform {
  required_providers {
    tfe = {
      version  = "~> 0.71.0"
    }
  }
}

provider "tfe" {
  hostname = var.hostname
}

data "tfe_organization" "org" {
  name = var.organization_name
}

resource "tfe_oauth_client" "oauth" {
  organization     = var.organization_name
  api_url          = "https://api.github.com"
  http_url         = "https://github.com"
  oauth_token      = var.github_oauth_token
  service_provider = "github"
}

resource "tfe_project" "demo_project" {
  name             = "Linked Stacks Demo"
  organization     = var.organization_name
  description      = "Project for demo linked stacks."
}

resource "tfe_stack" "network" {
  name = "demo-network-upstream"
  description = "Fake networking stack, used as upstream for demo."
  project_id = tfe_project.demo_project.id

  vcs_repo {
    identifier     = "jondavidjohn/demo-network-upstream"
    branch         = "main"
    oauth_token_id = tfe_oauth_client.oauth.oauth_token_id
  }
}

resource "tfe_stack" "storage" {
  name = "demo-storage-upstream"
  description = "Fake storage stack, used as upstream for demo."
  project_id = tfe_project.demo_project.id

  vcs_repo {
    identifier     = "jondavidjohn/demo-storage-upstream"
    branch         = "main"
    oauth_token_id = tfe_oauth_client.oauth.oauth_token_id
  }
}

resource "tfe_stack" "app" {
  name = "demo-app-downstream"
  description = "Fake app stack, used as downstream for demo."
  project_id = tfe_project.demo_project.id

  vcs_repo {
    identifier     = "jondavidjohn/demo-app-downstream"
    branch         = "main"
    oauth_token_id = tfe_oauth_client.oauth.oauth_token_id
  }
}
