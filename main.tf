resource "aws_ecr_repository" "default" {
  name = "${var.namespace}/${var.name}"
}

resource "aws_ecr_lifecycle_policy" "default" {
  repository = aws_ecr_repository.default.name

  policy = jsonencode({
    "rules" : concat(local.protected_images_rules, [
      {
        "rulePriority" : length(var.protected_images) + 1,
        "description" : "Always keep ${var.max_images_count} release [${var.release_images_prefix}] images stored.",
        "selection" : {
          "tagStatus" : "tagged",
          "tagPrefixList" : [var.release_images_prefix],
          "countType" : "imageCountMoreThan",
          "countNumber" : var.max_images_count
        },
        "action" : {
          "type" : "expire"
        }
      },
      {
        "rulePriority" : length(var.protected_images) + 2,
        "description" : "Always keep ${var.max_images_count} pre-release [${var.rc_images_prefix}] images stored.",
        "selection" : {
          "tagStatus" : "tagged",
          "tagPrefixList" : [var.rc_images_prefix],
          "countType" : "imageCountMoreThan",
          "countNumber" : var.max_images_count
        },
        "action" : {
          "type" : "expire"
        }
      },
      {
        "rulePriority" : length(var.protected_images) + 3,
        "description" : "Remove untagged images.",
        "selection" : {
          "tagStatus" : "untagged",
          "countType" : "imageCountMoreThan",
          "countNumber" : 1
        },
        "action" : {
          "type" : "expire"
        }
      },
      {
        "rulePriority" : length(var.protected_images) + 4,
        "description" : "Remove dev images when reached ${var.max_images_count} images stored.",
        "selection" : {
          "tagStatus" : "any",
          "countType" : "imageCountMoreThan",
          "countNumber" : var.max_images_count
        },
        "action" : {
          "type" : "expire"
        }
      }
    ])
  })
}
