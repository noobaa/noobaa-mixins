{
    //Common expressions to be used accross all rules categories should be added here
    prometheusRules+:: {
        groups+: [
        {
            name: 'ceph.rules',
            rules: [
                {
                },
            ],
        },
        ],
    },
}


