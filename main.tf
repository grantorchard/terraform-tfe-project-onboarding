module "github" {
  source  = "app.terraform.io/se-apj-demos/repos/github"
  version = "~> 0.0"

	project_name = var.project_name

  repository_name           = var.github_repository_name
  template_repository_name  = var.github_template_repository_name
	template_repository_owner = var.github_template_repository_owner
	github_team_members       = var.github_team_members
	create_repo               = var.github_create_repo
	github_connection_name    = var.github_connection_name
}

module "workspaces" {
	source  = "app.terraform.io/se-apj-demos/workspaces/tfe"
  version = "0.0.1"

	project_name = var.project_name

	github_repository_full_name = module.github.github_repository_full_name
	github_repository_branch = module.github.github_repository_default_branch
	github_connection_name = var.github_connection_name
	tfe_workspace_name = var.project_name
	tfe_org_name = var.tfe_org_name
}