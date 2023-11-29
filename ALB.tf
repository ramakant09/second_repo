resource "aws_lb" "test_lb" {
    name               = "test-lb-1"
    internal           = false
    load_balancer_type = "application" 
    security_groups    = ["${aws_security_group.web_sg.id}"]
    subnets            = var.subnets
    enable_cross_zone_load_balancing = "true"
    tags = {
         Environment = "Test app"
         Role        = "Sample-Application"
    }
}

resource "aws_lb_target_group" "test_tg" {
   name               = "my-test-tg"
   target_type        = "instance"
   port               = 80
   protocol           = "HTTP"
   vpc_id             = var.vpc_id
   health_check {
      healthy_threshold   = var.health_check["healthy_threshold"]
      interval            = var.health_check["interval"]
      unhealthy_threshold = var.health_check["unhealthy_threshold"]
      timeout             = var.health_check["timeout"]
      path                = var.health_check["path"]
      port                = var.health_check["port"]
  }
}

output "target_group_arn"{
    value=aws_lb_target_group.test_tg.arn
}

output "load_balancer_arn"{
    value=aws_lb.test_lb.id
}

output "target_group_id"{
    value=aws_lb_target_group.test_tg.id
}

resource "aws_lb_target_group_attachment" "tg_attachment_test" {
    target_group_arn = aws_lb_target_group.test_tg.arn
    target_id        = "${aws_instance.ec2_public.id}"
    port             = 80
}
resource "aws_lb_listener" "lb_listener_http" {
   load_balancer_arn    = aws_lb.test_lb.id
   port                 = "80"
   protocol             = "HTTP"
   default_action {
    target_group_arn = aws_lb_target_group.test_tg.id
    type             = "forward"
  }
}