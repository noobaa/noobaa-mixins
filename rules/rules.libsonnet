{
  //Common expressions to be used accross all rules categories should be added here
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
            record: 'job:NooBaa_buckets_health:sum',
            expr: |||
              sum(NooBaa_num_unhealthy_buckets + NooBaa_num_unhealthy_bucket_claims)
            ||| % $._config,
          },
          {
            record: 'job:NooBaa_bucket_count:sum',
            expr: |||
              sum(NooBaa_num_buckets + NooBaa_num_buckets_claims)
            ||| % $._config,
          },
          {
            record: 'job:NooBaa_total_object_count:sum',
            expr: |||
              sum(NooBaa_num_objects + NooBaa_num_objects_buckets_claims)
            ||| % $._config,
          },
        ],
      },
    ],
  },
}
