resource "kubernetes_namespace" "fargate" {
  metadata {
    labels = {
      app = "tech-challenge-api"
    }
    name = "fargate-node"
  }
}

resource "kubernetes_deployment" "app" {
  metadata {
    name      = "techchallenge-server"
    namespace = "fargate-node"
    labels    = {
      app = "tech-challenge-api"
    }
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "tech-challenge-api"
      }
    }

    template {
      metadata {
        labels = {
          app = "tech-challenge-api"
        }
      }

      spec {
        container {
          image = "alexjf1994/techchallenge"
          name  = "tech-challenge-api-server"

          port {
            container_port = 8080
          }
        }
      }
    }
  }
   depends_on = [kubernetes_namespace.fargate]

}

resource "kubernetes_service" "app" {
  metadata {
    name      = "tech-challenge-api-service"
    namespace = "fargate-node"
  }
  spec {
    selector = {
      app = "tech-challenge-api"
    }

    port {
      port        = 8080
      target_port = 8080
      protocol    = "TCP"
    }

    type = "NodePort"
  }

  depends_on = [kubernetes_deployment.app]
}

resource "kubernetes_ingress_v1" "app" {
  metadata {
    name        = "tech-challenge-api-lb"
    namespace   = "fargate-node"
    annotations = {
      "kubernetes.io/ingress.class"           = "alb"
      "alb.ingress.kubernetes.io/scheme"      = "internet-facing"
      "alb.ingress.kubernetes.io/target-type" = "ip"
    }
    labels = {
      "app" = "tech-challenge-api"
    }
  }

  spec {
    rule {
      http {
        path {
          path = "/"
          backend {
            service {
              name = kubernetes_service.app.metadata.0.name
              port {
                number = 8080
              }
            }
          }
        }
      }
    }
  }

  depends_on = [kubernetes_service.app]
}