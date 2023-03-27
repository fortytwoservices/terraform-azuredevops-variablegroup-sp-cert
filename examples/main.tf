# Example, should give the user an idea about how to use this module.
# This code is found in the examples directory.
resource "azuredevops_project" "example" {
  name               = "Example project"
  description        = "An example project"
  work_item_template = "Scrum"
}

resource "azuread_application" "example" {
  display_name = "Example app certificate"

  required_resource_access {
    resource_app_id = "00000003-0000-0000-c000-000000000000" # Microsoft Graph

    resource_access {
      id   = "e1fe6dd8-ba31-4d61-89e7-88639da4683d" # profile
      type = "Scope"
    }
  }
}

module "service_connection_deployment_dev" {
  source              = "amestofortytwo/variablegroup-sp-cert"
  application_id      = azuread_application.example.application_id
  devops_project_id   = azuredevops_project.example.id
  devops_project_name = azuredevops_project.example.name
  variable_group_name = "Example app"
  common_name_fqdn    = "contoso.com"
}
