resource "aws_lb" "app_lb" {
  name               = "poc-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.sg_id]
  subnets            = [var.public_subnet]
}

resource "aws_lb_target_group" "app_tg" {
  name     = "poc-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_listener" "app_listener" {
  load_balancer_arn = aws_lb.app_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app_tg.arn
  }
}

resource "aws_lb_target_group_attachment" "public_vm_attach" {
  target_group_arn = aws_lb_target_group.app_tg.arn
  target_id        = var.target_id
  port             = 80
}
