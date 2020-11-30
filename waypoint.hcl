project = "hello-waypoint"

app "hello-waypoint" {
    build {
        use "pack" {
            builder="paketobuildpacks/builder:base"
        }
        registry {
            use "docker" {
                image = "jbayer/hello-waypoint"
                tag = "latest"
            }
        }
    }
    deploy {
        use "kubernetes" {
            service_port=8080
            probe_path="/actuator/health"
        }
    }
    release {
        use "kubernetes" {
            load_balancer=true
        }
    }
}