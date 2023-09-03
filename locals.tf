locals {
  protected_images_rules = [
    for index, tag in var.protected_images : {
      rulePriority = index + 1,
      description  = "Protect ${tag} - always keep the latest version",
      selection = {
        tagStatus     = "tagged",
        countType     = "imageCountMoreThan",
        countNumber   = 1,
        tagPrefixList = [tag],
      },
      action = {
        type = "expire",
      },
    }
  ]
}
