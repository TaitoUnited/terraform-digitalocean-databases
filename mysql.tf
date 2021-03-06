/**
 * Copyright 2021 Taito United
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

resource "digitalocean_database_cluster" "mysql" {
  for_each   = {for item in local.mysqlClusters: item.name => item}

  name                 = each.value.name
  engine               = "mysql"
  version              = each.value.version
  size                 = each.value.size
  region               = each.value.region
  node_count           = each.value.nodeCount
  sql_mode             = each.value.sqlMode != null ? each.value.sqlMode : null

  private_network_uuid = var.private_network_id

  maintenance_window {
    day = each.value.maintenanceDay
    hour = each.value.maintenanceHour
  }

  lifecycle {
    prevent_destroy = true
  }
}
