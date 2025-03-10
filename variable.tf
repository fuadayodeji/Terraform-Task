variable "environments" {
  type = map(object({
    resource_group_name = string
    storage_accounts = list(object({
      name         = string
      account_tier = string
      replication  = string
      costcentre   = string
      productname  = string
    }))
    location = string
  }))
}

variable "selected_env" {
  type = string
}


