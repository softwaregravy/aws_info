namespace :db do 
  desc "drops the Ec2TypeSpecification table and rebuilds it"
  task :reset_ec2_type_specifications => :environment do 
    # http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html

    Ec2TypeSpecification.delete_all

    Ec2TypeSpecification.find_or_create_by_api_name("t1.micro",
                                                    name: "Micro",
                                                    api_type: "uODI",
                                                    api_size: "u",
                                                    memory: 613.megabytes,
                                                    compute_units: 2,
                                                    support_32_bit: true,
                                                    support_64_bit: true,
                                                    cores: 2,
                                                    core_type: "virtual burst",
                                                    ephemeral_drives: 0,
                                                    total_ephemeral_storage: 0,
                                                    ebs_optimization: 0,
                                                    io_performance: "low",
                                                    max_ips: 1)

    Ec2TypeSpecification.find_or_create_by_api_name("m1.small",
                                                    name: "M1 Small",
                                                    api_type: "stdODI",
                                                    api_size: "sm",
                                                    memory: 1.7.gigabytes,
                                                    compute_units: 1,
                                                    support_32_bit: true,
                                                    support_64_bit: true,
                                                    cores: 1,
                                                    core_type: "virtual",
                                                    ephemeral_drives: 1,
                                                    total_ephemeral_storage: 160.gigabytes,
                                                    ebs_optimization: 0,
                                                    io_performance: "moderate",
                                                    max_ips: 8)

    Ec2TypeSpecification.find_or_create_by_api_name("m1.medium",
                                                    name: "M1 Medium",
                                                    api_type: "stdODI",
                                                    api_size: "med",
                                                    memory: 3.75.gigabytes,
                                                    compute_units: 2,
                                                    support_32_bit: true,
                                                    support_64_bit: true,
                                                    cores: 2,
                                                    core_type: "virtual",
                                                    ephemeral_drives: 1,
                                                    total_ephemeral_storage: 410.gigabytes,
                                                    ebs_optimization: 0,
                                                    io_performance: "moderate",
                                                    max_ips: 8)

    Ec2TypeSpecification.find_or_create_by_api_name("m1.large",
                                                    name: "M1 Large",
                                                    api_type: "stdODI",
                                                    api_size: "lg",
                                                    memory: 7.5.gigabytes,
                                                    compute_units: 4,
                                                    support_32_bit: false,
                                                    support_64_bit: true,
                                                    cores: 2,
                                                    core_type: "virtual",
                                                    ephemeral_drives: 2,
                                                    total_ephemeral_storage: 840.gigabytes,
                                                    ebs_optimization: 500,
                                                    io_performance: "moderate",
                                                    max_ips: 8)

    Ec2TypeSpecification.find_or_create_by_api_name("m1.xlarge",
                                                    name: "M1 Extra Large",
                                                    api_type: "stdODI",
                                                    api_size: "xl",
                                                    memory: 15.gigabytes,
                                                    compute_units: 8,
                                                    support_32_bit: false,
                                                    support_64_bit: true,
                                                    cores: 2,
                                                    core_type: "virtual",
                                                    ephemeral_drives: 4,
                                                    total_ephemeral_storage: 1680.gigabytes,
                                                    ebs_optimization: 500,
                                                    io_performance: "high",
                                                    max_ips: 8)
  end 
end 
