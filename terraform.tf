terraform {
  required_providers {
    azuread = {
      source = "hashicorp/azuread"
    }

    azuredevops = {
      source = "microsoft/azuredevops"
    }

    pkcs12 = {
      source  = "chilicat/pkcs12"
      version = ">0.0.7"
    }

    tls = {
      source  = "hashicorp/tls"
      version = ">3.3.0"
    }
  }
}

data "azuread_client_config" "current" {}
