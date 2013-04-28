class AwsInstancesController < ApplicationController
  def index
    @pricing = Ec2Data.pricing
    @types = Ec2Data.type_specifications
    @columns = 
      [
        ["Name", "name"], 
        ["API name", "api_name"], 
        ["Cores", "cores"], 
        ["Core Type", "core_type"], 
        ["Architecture", "architecture"],
        ["Compute Units", "compute_units"], 
        ["EBS Optimization", "ebs_optimization"], 
        ["Ephemeral Drives", "ephemeral_drives"], 
        ["IO Performance", "io_performance"], 
        ["Max IPs", "max_ips"], 
        ["Memory (GiB)", "memory"], 
        ["Ephemeral Storage (GiB)", "total_ephemeral_storage"],
        ["Linux Cost Per Hour ($)", "linux_cost_per_hour"],
    ]
  end
end
