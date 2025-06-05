locals {
  rendered_html = templatefile("${path.module}/../src/index.html.tpl", {
    developer = var.developer
  })

  ec2_user_data = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl enable httpd
    systemctl start httpd

    echo '${replace(local.rendered_html, "'", "'\"'\"'")}' > /var/www/html/index.html
  EOF
}

