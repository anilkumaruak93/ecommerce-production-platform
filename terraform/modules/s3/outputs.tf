output "bucket_name" {
  description = "Name of the Velero backup S3 bucket"
  value       = aws_s3_bucket.this.bucket
}

output "bucket_arn" {
  description = "ARN of the Velero backup S3 bucket"
  value       = aws_s3_bucket.this.arn
}

output "bucket_id" {
  description = "ID of the Velero backup S3 bucket"
  value       = aws_s3_bucket.this.id
}