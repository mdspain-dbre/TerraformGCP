# See versions at https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance#database_version
resource "google_sql_database_instance" "md-mysql-db-instance" {
  name             = "md-mysql-db-instance"
  region           = "us-central1"
  database_version = "MYSQL_8_0"
  settings {
    tier = "db-f1-micro"
  }

  deletion_protection  = false
}

resource "google_sql_database" "md-mysql-db-tf" {
  name     = "md-test-db"
  instance = google_sql_database_instance.md-mysql-db-instance.name
}

resource "google_sql_user" "myuser" {
  name     = "md-testuser"
  instance = google_sql_database_instance.md-mysql-db-instance.name
  password = "testuser123"
}