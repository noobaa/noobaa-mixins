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
            alert: 'NooBaaNamespaceBucketErrorState',
            expr: |||
              NooBaa_namespace_bucket_status{bucket_name=~".*"} == 0
            ||| % $._config,
            'for': $._config.bucketErrorStateAlertTime,
            labels: {
              severity: 'warning',
            },
            annotations: {
              message: 'A NooBaa Namespace Bucket Is In Error State',
              description: 'A NooBaa namespace bucket {{ $labels.bucket_name }} is in error state for more than %s' % $._config.bucketErrorStateAlertTime,
              storage_type: $._config.storageType,
              severity_level: 'warning',
            },
          },
          {
            alert: 'NooBaaBucketReachingSizeQuotaState',
            expr: |||
              NooBaa_bucket_size_quota{bucket_name=~".*"} > 80
            ||| % $._config,
            'for': $._config.bucketErrorStateAlertTime,
            labels: {
              severity: 'warning',
            },
            annotations: {
              message: 'A NooBaa Bucket Is In Reaching Size Quota State',
              description: 'A NooBaa bucket {{ $labels.bucket_name }} is using {{ printf "%0.0f" $value }}% of its size quota',
              storage_type: $._config.storageType,
              severity_level: 'warning',
            },
          },
          {
            alert: 'NooBaaBucketExceedingSizeQuotaState',
            expr: |||
              NooBaa_bucket_size_quota{bucket_name=~".*"} >= 100
            ||| % $._config,
            'for': $._config.bucketErrorStateAlertTime,
            labels: {
              severity: 'warning',
            },
            annotations: {
              message: 'A NooBaa Bucket Is In Exceeding Size Quota State',
              description: 'A NooBaa bucket {{ $labels.bucket_name }} is exceeding its size quota - {{ printf "%0.0f" $value }}% used',
              storage_type: $._config.storageType,
              severity_level: 'warning',
            },
          },
          {
            alert: 'NooBaaBucketReachingQuantityQuotaState',
            expr: |||
              NooBaa_bucket_quantity_quota{bucket_name=~".*"} > 80
            ||| % $._config,
            'for': $._config.bucketErrorStateAlertTime,
            labels: {
              severity: 'warning',
            },
            annotations: {
              message: 'A NooBaa Bucket Is In Reaching Quantity Quota State',
              description: 'A NooBaa bucket {{ $labels.bucket_name }} is using {{ printf "%0.0f" $value }}% of its quantity quota',
              storage_type: $._config.storageType,
              severity_level: 'warning',
            },
          },
          {
            alert: 'NooBaaBucketExceedingQuantityQuotaState',
            expr: |||
              NooBaa_bucket_quantity_quota{bucket_name=~".*"} >= 100
            ||| % $._config,
            'for': $._config.bucketErrorStateAlertTime,
            labels: {
              severity: 'warning',
            },
            annotations: {
              message: 'A NooBaa Bucket Is In Exceeding Quantity Quota State',
              description: 'A NooBaa bucket {{ $labels.bucket_name }} is exceeding its quantity quota - {{ printf "%0.0f" $value }}% used',
              storage_type: $._config.storageType,
              severity_level: 'warning',
            },
          },
          {
            alert: 'NooBaaBucketLowCapacityState',
            expr: |||
              NooBaa_bucket_capacity{bucket_name=~".*"} > 80
            ||| % $._config,
            'for': $._config.bucketErrorStateAlertTime,
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
            'for': $._config.bucketErrorStateAlertTime,
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
