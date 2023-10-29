## Security group

resource "aws_security_group" "lb" {
    name = "lb-sg-dev"
    description = "Allow  http"
    vpc_id = aws_vpc.vpc1.id

    ingress {
        description = "allow http"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
  tags= {
    env = "Dev"
  }
}

resource "aws_security_group" "ec2" {
    name = "web-sg-dev"
    description = "Allow  http"
    vpc_id = aws_vpc.vpc1.id

    ingress {
        description = "allow http"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        security_groups = [aws_security_group.lb.id]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
  tags= {
    env = "Dev"
  }

}