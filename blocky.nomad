job "dns" {
  datacenters = ["dc1"]

  group "blocky" {
    network {
      port "dns" {
        to = 53
      }
      port "http" {
        to = 4000
      }
    }

    task "blocky" {
      driver = "docker"

      config {
        image = "spx01/blocky"

        ports = ["dns", "http"]
      }

      resources {
        cpu    = 500
        memory = 256
      }
    }
  }
}
