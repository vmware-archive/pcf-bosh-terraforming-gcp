variable "project" {
  type = "string"
}

variable "env_name" {
  type = "string"
}

variable "region" {
  type = "string"
}

variable "zones" {
  type = "list"
}

variable "service_account_key" {
  type = "string"
}

variable "dns_suffix" {
  type = "string"
}

variable "ssl_cert" {
  type        = "string"
  description = "ssl certificate content"
}

variable "ssl_cert_private_key" {
  type        = "string"
  description = "ssl certificate private key content"
}

variable "sql_db_tier" {
  type    = "string"
  default = "db-f1-micro"
}

/***********************
 * Optional ERT Config *
 ***********************/

/* You can opt in to create a Google SQL Database Instance, Database, and User for ERT.
By default we have `ert_sql_instance_count` set to `0` but setting it to `1` will create them. */

variable "ert_sql_instance_count" {
  type        = "string"
  default     = "0"
  description = "Optional configuration of a Google SQL Database Instance, Database, and User."
}

variable "ert_sql_db_host" {
  type    = "string"
  default = ""
}

variable "ert_sql_db_username" {
  type    = "string"
  default = ""
}

variable "ert_sql_db_password" {
  type    = "string"
  default = ""
}

/***********************
 * Optional DNS Config *
 ***********************/

/* If you have an existing managed zone in Cloud DNS, you can opt in to adding
 * this environment's NS record to that zone.
 */

variable "parent_managed_zone" {
  type = "string"
  default = ""
  Description = "Name of managed zone to add this environment's name servers to"
}