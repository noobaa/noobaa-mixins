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
            record: 'job:noobaa_total_unhealthy_buckets:sum',
            expr: |||
              sum(NooBaa_num_unhealthy_buckets + NooBaa_num_unhealthy_bucket_claims)
            ||| % $._config,
          },
          {
            record: 'job:noobaa_bucket_count:sum',
            expr: |||
              sum(NooBaa_num_buckets + NooBaa_num_buckets_claims)
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
    ],
  },
}
