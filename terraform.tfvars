environments = {
  test = {
    resource_group_name = "rg-test"
    location            = "UK South"
    storage_accounts = [
      { name = "storagetest123", account_tier = "Standard", replication = "LRS", costcentre = "test-cost", productname = "test-product" }
    ]
  }
  stage = {
    resource_group_name = "rg-stage"
    location            = "UK South"
    storage_accounts = [
      { name = "storagestage123", account_tier = "Standard", replication = "GRS", costcentre = "stg-cost", productname = "stg-product" }
    ]
  }
  prod = {
    resource_group_name = "rg-prod"
    location            = "UK South"
    storage_accounts = [
      { name = "storageprod123", account_tier = "Premium", replication = "ZRS", costcentre = "prod-cost", productname = "prod-product" },
      { name = "storageprodbackup", account_tier = "Standard", replication = "LRS", costcentre = "prod-01-cost", productname = "prod01-product" }
    ]
  }
}