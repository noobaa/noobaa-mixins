{
  //Common expressions to be used across all rules categories should be added here
  prometheusRules+:: {
    groups+: [
      // {
      //   name: 'noobaa.rules',
      //   rules: [
      //     {
      //     },
      //   ],
      // },
      {
        name: 'noobaa-telemeter.rules',
        rules: [
          {
            record: 'job:noobaa_total_unhealthy_buckets:sum',
            expr: |||
              sum(NooBaa_num_unhealthy_buckets + NooBaa_num_unhealthy_bucket_claims)
            ||| % $._config,
          },
          {
            record: 'job:noobaa_total_unhealthy_namespace_buckets',
            expr: |||
              NooBaa_num_unhealthy_namespace_buckets
            ||| % $._config,
          },
          {
            record: 'job:noobaa_bucket_count:sum',
            expr: |||
              sum(NooBaa_num_buckets + NooBaa_num_buckets_claims)
            ||| % $._config,
          },
          {
            record: 'job:noobaa_namespace_bucket_count',
            expr: |||
              NooBaa_num_namespace_buckets
            ||| % $._config,
          },
          {
            record: 'job:noobaa_total_object_count:sum',
            expr: |||
              sum(NooBaa_num_objects + NooBaa_num_objects_buckets_claims)
            ||| % $._config,
          },
          {
            record: 'noobaa_accounts_num',
            expr: |||
              NooBaa_accounts_num
            ||| % $._config,
          },
          {
            record: 'noobaa_total_usage',
            expr: |||
              NooBaa_total_usage
            ||| % $._config,
          },
        ],
      },
      {
        name: 'noobaa-odf.rules',
        rules: [
          {
            record: 'odf_system_health_status',
            expr: |||
              NooBaa_odf_health_status
            ||| % $._config,
            labels: {
              system_vendor: 'Red Hat',
              system_type: 'OCS',
            },
          },
          {
            record: 'odf_system_raw_capacity_used_bytes',
            expr: |||
              NooBaa_total_usage
            ||| % $._config,
            labels: {
              system_vendor: 'Red Hat',
              system_type: 'OCS',
            },
          },
          {
            record: 'odf_system_iops_total_bytes',
            expr: |||
              sum by (namespace, managedBy, job, service) (rate(NooBaa_providers_ops_read_num[5m]) + rate(NooBaa_providers_ops_write_num[5m]))
            ||| % $._config,
            labels: {
              system_vendor: 'Red Hat',
              system_type: 'OCS',
            },
          },
          {
            record: 'odf_system_throughput_total_bytes',
            expr: |||
              sum by (namespace, managedBy, job, service) (rate(NooBaa_providers_bandwidth_read_size[5m]) + rate(NooBaa_providers_bandwidth_write_size[5m]))
            ||| % $._config,
            labels: {
              system_vendor: 'Red Hat',
              system_type: 'OCS',
            },
          },
          {
            record: 'odf_system_bucket_count',
            expr: |||
              sum by (namespace, job, service) (NooBaa_num_buckets + NooBaa_num_buckets_claims)
            ||| % $._config,
            labels: {
              system_vendor: 'Red Hat',
              system_type: 'OCS',
            },
          },
          {
            record: 'odf_system_objects_total',
            expr: |||
              sum by (namespace, job, service) (NooBaa_num_objects + NooBaa_num_objects_buckets_claims)
            ||| % $._config,
            labels: {
              system_vendor: 'Red Hat',
              system_type: 'OCS',
            },
          },
        ],
      },
      {
        name: 'noobaa-replication.rules',
        rules: [
          {
            record: 'noobaa_replication_total_writes_size',
            expr: |||
              sum_over_time(sum by (replication_id) (NooBaa_replication_last_cycle_writes_size)[1y:6m])
            ||| % $._config,
          },
          {
            record: 'noobaa_replication_total_writes_num',
            expr: |||
              sum_over_time(sum by (replication_id) (NooBaa_replication_last_cycle_writes_num)[1y:6m])
            ||| % $._config,
          },
          {
            record: 'noobaa_replication_total_error_writes_size',
            expr: |||
              sum_over_time(sum by (replication_id) (NooBaa_replication_last_cycle_error_writes_size)[1y:6m])
            ||| % $._config,
          },
          {
            record: 'noobaa_replication_total_error_writes_num',
            expr: |||
              sum_over_time(sum by (replication_id) (NooBaa_replication_last_cycle_error_writes_num)[1y:6m])
            ||| % $._config,
          },
          {
            record: 'noobaa_replication_total_cycles',
            expr: |||
              count_over_time(count by (replication_id) (NooBaa_replication_last_cycle_writes_size)[1y:6m])
            ||| % $._config,
          },
        ],
      },
    ],
  },
}
