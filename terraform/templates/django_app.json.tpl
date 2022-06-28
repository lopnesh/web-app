[
  {
    "name": "web-app",
    "image": "${docker_image_url_webapp}",
    "essential": true,
    "cpu": 10,
    "memory": 512,
    "links": [],
    "portMappings": [
      {
        "containerPort": 8080,
        "hostPort": 0,
        "protocol": "tcp"
      }
    ],
    "environment": [
      {
        "name": "DB_NAME",
        "value": "userdata"
      },
      {
        "name": "AWS_DEFAULT_REGION",
        "value": "${region}"
      },
      {
        "name": "ALLOWED_HOSTS",
        "value": "${allowed_hosts}"
      },
      {
        "name": "DB_USER",
        "value": "${rds_username}"
      },
      {
        "name": "DB_PASS",
        "value": "${rds_password}"
      },
      {
        "name": "DB_ENDPOINT",
        "value": "${rds_hostname}"
      }
    ],
    "logConfiguration": {
      "logDriver": "awslogs",
      "options": {
        "awslogs-group": "/ecs/web-app",
        "awslogs-region": "${region}",
        "awslogs-stream-prefix": "web-app-log-stream"
      }
    }
  },
  {
    "name": "nginx",
    "image": "${docker_image_url_nginx}",
    "essential": true,
    "cpu": 10,
    "memory": 128,
    "links": ["web-app"],
    "portMappings": [
      {
        "containerPort": 80,
        "hostPort": 0,
        "protocol": "tcp"
      }
    ],
    "mountPoints": [
      {
        "containerPath": "/usr/src/app/staticfiles",
        "sourceVolume": "static_volume"
      }
    ],
    "logConfiguration": {
      "logDriver": "awslogs",
      "options": {
        "awslogs-group": "/ecs/nginx",
        "awslogs-region": "${region}",
        "awslogs-stream-prefix": "nginx-log-stream"
      }
    }
  }
]
