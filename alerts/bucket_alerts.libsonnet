{
  prometheusAlerts+:: {
    groups+: [
      {
        name: 'bucket-quota-alert.rules',
        rules: [
          /* {
            alert: 'NooBaaBucketQuotaWarning',
            expr: |||
              NooBaa_bucket_quota{} > 0.85
            ||| % $._config,
            labels: {
              severity: 'warning',
            },
            annotations: {
              message: 'A NooBaa Bucket Is Approaching Its Quota',
              description: 'A NooBaa bucket is approaching its quota, usage is more than 85%',
              storage_type: $._config.storageType,
              severity_level: 'warning',
            },
          }, */
        ],
      },
    ],
  },
}
