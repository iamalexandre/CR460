# Definir le fournisseur nuagique
provider "google" {
  credentials = "${file("tpsession.json")}"
  project     = "travail-session-201518"
  region      = "northamerica-northeast1"
}

# Definition du VPC
resource "google_compute_network" "tpsession-cr460" {
  name                    = "tpsession-cr460" # Nom du reseau
  auto_create_subnetworks = "false"
}

#Definition du sous-reseau
resource "google_compute_subnetwork" "cr460-subnet1" {
  name          = "tpsessiosubnet1"                             # Nom
  ip_cidr_range = "10.1.0.0/24"                               # Adresse IP
  network       = "${google_compute_network.tpsession-cr460.self_link}" # Liens vers le reseau
  region        = "northamerica-northeast1"                   # Region
}

resource "google_sql_database_instance" "master" {
  name = "instwordpress"
  region = "northamerica-northeast1"

  settings {
    tier = "db-f1-micro"
    ip_configuration {
            ipv4_enabled = true
            authorized_networks {
              value="0.0.0.0/0"
            }
        }
    }
}

resource "google_sql_database" "dbwordpress" {
  name      = "wordpress"
  instance  = "${google_sql_database_instance.master.name}"
  charset   = "utf8mb4"
}

resource "google_sql_user" "users" {
  name     = "root"
  instance = "${google_sql_database_instance.master.name}"
  password = "w2preswsw"
}
