locals {
  rendered_html = templatefile("${path.module}/../src/index.html.tpl")

  ec2_user_data = <<-EOF
    #!/bin/bash
    apt update -y
    apt install -y apache2
    echo '${replace(local.rendered_html, "'", "'\"'\"'")}' > /var/www/html/index.html
    systemctl enable apache2
    systemctl start apache2
  EOF
}
