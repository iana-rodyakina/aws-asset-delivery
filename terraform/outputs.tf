output "cloudfront_domain_name" {
  description = "CloudFront distribution domain name"
  value       = "https://${aws_cloudfront_distribution.assets.domain_name}/test.txt"
}

output "s3_bucket_name" {
  description = "S3 bucket name"
  value       = aws_s3_bucket.assets.bucket
}

output "cloudwatch_alarm_name" {
  description = "CloudWatch alarm name"
  value       = aws_cloudwatch_metric_alarm.cloudfront_5xx.alarm_name
}