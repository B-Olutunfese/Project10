resource "aws_ecs_service" "pro10" {
  name            = "worker"
  cluster         = aws_ecs_cluster.ecs_cluster-project10.id
  task_definition = aws_ecs_task_definition.project10.arn
  desired_count   = 2
}