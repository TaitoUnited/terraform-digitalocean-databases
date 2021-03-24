# DigitalOcean databases

Example usage:

```
provider "digitalocean" {
  token                = var.do_token
}

module "databases" {
  source               = "TaitoUnited/databases/digitalocean"
  version              = "1.0.0"

  private_network_id   = module.network.private_network_id

  postgresql_clusters  = yamldecode(file("${path.root}/../infra.yaml"))["postgresqlClusters"]
  mysql_clusters       = yamldecode(file("${path.root}/../infra.yaml"))["mysqlClusters"]
}
```

Example YAML:

```
postgresqlClusters:
  - name: my-common-postgres
    region: ams2
    version: "11"
    size: db-s-1vcpu-1gb
    nodeCount: 1
    maintenanceDay: 1
    maintenanceHour: 23

mysqlClusters:
  - name: my-common-mysql
    region: ams2
    version: "8"
    size: db-s-1vcpu-1gb
    nodeCount: 1
    maintenanceDay: 1
    maintenanceHour: 23
```

YAML attributes:

- See variables.tf for all the supported YAML attributes.
- See [database_cluster](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/database_cluster) for attribute descriptions.

Combine with the following modules to get a complete infrastructure defined by YAML:

- [DNS](https://registry.terraform.io/modules/TaitoUnited/dns/digitalocean)
- [Network](https://registry.terraform.io/modules/TaitoUnited/network/digitalocean)
- [Kubernetes](https://registry.terraform.io/modules/TaitoUnited/kubernetes/digitalocean)
- [Databases](https://registry.terraform.io/modules/TaitoUnited/databases/digitalocean)
- [Storage](https://registry.terraform.io/modules/TaitoUnited/storage/digitalocean)
- [PostgreSQL privileges](https://registry.terraform.io/modules/TaitoUnited/privileges/postgresql)
- [MySQL privileges](https://registry.terraform.io/modules/TaitoUnited/privileges/mysql)

TIP: Similar modules are also available for AWS, Azure, and Google Cloud. All modules are used by [infrastructure templates](https://taitounited.github.io/taito-cli/templates#infrastructure-templates) of [Taito CLI](https://taitounited.github.io/taito-cli/). See also [DigitalOcean project resources](https://registry.terraform.io/modules/TaitoUnited/project-resources/digitalocean), [Full Stack Helm Chart](https://github.com/TaitoUnited/taito-charts/blob/master/full-stack), and [full-stack-template](https://github.com/TaitoUnited/full-stack-template).

Contributions are welcome!
