module "main" {
    source = "../terraform-aws-sg"
    project_name = var.project_name
    sg_name = var.sg_name
    sg_description = var.sg_description
    sg_ingress = var.sg_ingress
    vpc_id = local.vpc_id
    common_tags = var.common_tags
}