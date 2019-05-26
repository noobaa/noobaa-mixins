{
  prometheusAlerts+:: {
    groups+: [
      {
        name: 'resource-state-alert.rules',
        rules: [
          {
            alert: 'NooBaaResourceErrorState',
            expr: |||
              noobaa_resource_health_status{} > 1
            ||| % $._config,
            'for': $._config.resourceErrorStateAlertTime,
            labels: {
              severity: 'critical',
            },
            annotations: {
              message: 'A NooBaa Resource Is In Error State',
              description: 'A NooBaa resource is in error state for more than %s.' % $._config.resourceErrorStateAlertTime,
              storage_type: $._config.storageType,
              severity_level: 'error',
            },
          },
        ],
      },
    ],
  },
}