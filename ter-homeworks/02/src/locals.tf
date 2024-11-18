locals {
    platform_name = "${var.vm_web_loc_platform}-${var.vm_web_loc_branch}-${var.vm_web_loc_name}"
    database_name = "${var.vm_db_loc_platform}-${var.vm_db_loc_branch}-${var.vm_db_loc_name}"
}
