output "name" {
  description = "Status of the chart deployment"
  value       = helm_release.prometheus.status
}
