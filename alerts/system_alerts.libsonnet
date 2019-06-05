{
  prometheusAlerts+:: {
    groups+: [
      {
        name: 'system-capacity-alert.rules',
        rules: [
          {
            alert: 'NooBaaSystemCapacityWarning85',
            expr: |||
              noobaa_system_capacity{} > 85
            ||| % $._config,
            labels: {
              severity: 'warning',
            },
            annotations: {
              message: 'A NooBaa System Is Approaching Its Capacity',
              description: 'A NooBaa system is approaching its capacity, usage is more than 85%',
              storage_type: $._config.storageType,
              severity_level: 'warning',
            },
          },
          {
            alert: 'NooBaaSystemCapacityWarning95',
            expr: |||
              noobaa_system_capacity{} > 95
            ||| % $._config,
            labels: {
              severity: 'warning',
            },
            annotations: {
              message: 'A NooBaa System Is Approaching Its Capacity',
              description: 'A NooBaa system is approaching its capacity, usage is more than 95%',
              storage_type: $._config.storageType,
              severity_level: 'warning',
            },
          },
          {
            alert: 'NooBaaSystemCapacityWarning100',
            expr: |||
              noobaa_system_capacity{} == 100
            ||| % $._config,
            labels: {
              severity: 'warning',
            },
            annotations: {
              message: 'A NooBaa System Approached Its Capacity',
              description: 'A NooBaa system approached its capacity, usage is at 100%',
              storage_type: $._config.storageType,
              severity_level: 'warning',
            },
          },
        ],
      },
    ],
  },
}
