class AwsInstancesController < ApplicationController
  before_filter :set_region

  def index
    @pricing = Ec2Data.pricing
    @types = Ec2Data.type_specifications(@region)
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
        ["Linux Cost Per Memory Gi B ($)", "linux_cost_per_memory_GiB"], 
        ["Linux Cost Per Cores ($)", "linux_cost_per_cores"], 
        ["Linux Cost Per Storage Gi B ($)", "linux_cost_per_storage_GiB"], 
        ["Linux Cost Per Ephemeral Drives ($)", "linux_cost_per_ephemeral_drives"], 
        ["Linux Cost Per Compute Units ($)", "linux_cost_per_compute_units"], 
        ["Linux Cost Per Ebs Optimization ($)", "linux_cost_per_ebs_optimization"], 
        ["Linux Cost Per Max Ips ($)", "linux_cost_per_max_ips"],
        ["MSWin Cost Per Hour ($)", "mswin_cost_per_hour"],
        ["MSWin Cost Per Storage Gi B ($)", "mswin_cost_per_storage_GiB"], 
        ["MSWin Cost Per Ebs Optimization ($)", "mswin_cost_per_ebs_optimization"], 
        ["MSWin Cost Per Ephemeral Drives ($)", "mswin_cost_per_ephemeral_drives"], 
        ["MSWin Cost Per Cores ($)", "mswin_cost_per_cores"], 
        ["MSWin Cost Per Compute Units ($)", "mswin_cost_per_compute_units"], 
        ["MSWin Cost Per Memory Gi B ($)", "mswin_cost_per_memory_GiB"], 
        ["MSWin Cost Per Max Ips ($)", "mswin_cost_per_max_ips"], 
    ]
  end

  private 
  def set_region
    @region = params[:region] || 'us-east'
  end 
end
