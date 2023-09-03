output "self" {
  value       = aws_ecr_repository.default
  description = "An aws_ecr_repository resource itself."
}

output "registry_id" {
  value       = aws_ecr_repository.default.registry_id
  description = "Registry ID."
}

output "repository_url" {
  value       = aws_ecr_repository.default.repository_url
  description = "Repository URL."
}

output "repository_name" {
  value       = aws_ecr_repository.default.name
  description = "Repository name."
}
