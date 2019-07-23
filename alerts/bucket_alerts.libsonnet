{
  prometheusAlerts+:: {
    groups+: [
      {
        name: 'bucket-state-alert.rules',
        rules: [
          {
            alert: 'NooBaaBucketErrorState',
            expr: |||
              NooBaa_bucket_status{bucket_name=~".*"} == 0
            ||| % $._config,
            'for': $._config.bucketErrorStateAlertTime,
            labels: {
              severity: 'warning',
            },
            annotations: {
              message: 'A NooBaa Bucket Is In Error State',
              description: 'A NooBaa bucket {{ $labels.bucket_name }} is in error state for more than %s' % $._config.bucketErrorStateAlertTime,
              storage_type: $._config.storageType,
              severity_level: 'warning',
            },
          },
          {
            alert: 'NooBaaBucketReachingQuotaState',
            expr: |||
              NooBaa_bucket_quota{bucket_name=~".*"} > 80
            ||| % $._config,
            labels: {
              severity: 'warning',
            },
            annotations: {
              message: 'A NooBaa Bucket Is In Reaching Quota State',
              description: 'A NooBaa bucket {{ $labels.bucket_name }} is using {{ printf "%0.0f" $value }}% of its quota',
              storage_type: $._config.storageType,
              severity_level: 'warning',
            },
          },
          {
            alert: 'NooBaaBucketExceedingQuotaState',
            expr: |||
              NooBaa_bucket_quota{bucket_name=~".*"} >= 100
            ||| % $._config,
            labels: {
              severity: 'warning',
            },
            annotations: {
              message: 'A NooBaa Bucket Is In Exceeding Quota State',
              description: 'A NooBaa bucket {{ $labels.bucket_name }} is exceeding its quota - {{ printf "%0.0f" $value }}% used',
              storage_type: $._config.storageType,
              severity_level: 'warning',
            },
          },
          {
            alert: 'NooBaaBucketLowCapacityState',
            expr: |||
              NooBaa_bucket_capacity{bucket_name=~".*"} > 80
            ||| % $._config,
            labels: {
              severity: 'warning',
            },
            annotations: {
              message: 'A NooBaa Bucket Is In Low Capacity State',
              description: 'A NooBaa bucket {{ $labels.bucket_name }} is using {{ printf "%0.0f" $value }}% of its capacity',
              storage_type: $._config.storageType,
              severity_level: 'warning',
            },
          },
          {
            alert: 'NooBaaBucketNoCapacityState',
            expr: |||
              NooBaa_bucket_capacity{bucket_name=~".*"} > 95
            ||| % $._config,
            labels: {
              severity: 'warning',
            },
            annotations: {
              message: 'A NooBaa Bucket Is In No Capacity State',
              description: 'A NooBaa bucket {{ $labels.bucket_name }} is using all of its capacity',
              storage_type: $._config.storageType,
              severity_level: 'warning',
            },
          },
        ],
      },
    ],
  },
}
