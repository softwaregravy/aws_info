class AwsInstancesController < ApplicationController
  before_filter :set_region

  caches_action :index, :expires_in => 1.hour

  def index
    @pricing = Ec2Data.pricing
    @types = Ec2Data.type_specifications(@region)
    @columns = [
        ["Name", "name", true, "all"], 
        ["API name", "api_name", true, "all"], 
        ["Linux Cost Per Hour ($)", "linux_cost_per_hour", true, "linux"],
        ["MSWin Cost Per Hour ($)", "mswin_cost_per_hour", false, "mswin"],
        ["Cores", "cores", true, "all"], 
        ["Core Type", "core_type", false, "all"], 
        ["Linux Cost Per Core ($)", "linux_cost_per_cores", false, "linux"], 
        ["MSWin Cost Per Core ($)", "mswin_cost_per_cores", false, "mswin"], 
        ["Compute Units", "compute_units", true, "all"], 
        ["Linux Cost Per Compute Unit ($)", "linux_cost_per_compute_units", false, "linux"], 
        ["MSWin Cost Per Compute Unit ($)", "mswin_cost_per_compute_units", false, "mswin"], 
        ["Architecture", "architecture", false, "all"],
        ["EBS Optimization (Mbps)", "ebs_optimization", false, "all"], 
        ["Linux Cost Per EBS Mbp ($)", "linux_cost_per_ebs_optimization", false, "linux"], 
        ["MSWin Cost Per EBS Mbp ($)", "mswin_cost_per_ebs_optimization", false, "mswin"], 
        ["Ephemeral Drives", "ephemeral_drives", false, "all"], 
        ["Linux Cost Per Ephemeral Drive ($)", "linux_cost_per_ephemeral_drives", false, "linux"], 
        ["MSWin Cost Per Ephemeral Drive ($)", "mswin_cost_per_ephemeral_drives", false, "mswin"], 
        ["IO Performance", "io_performance", true, "all"], 
        ["Memory (GiB)", "memory_GiB", true, "all"], 
        ["Linux Cost Per Memory GiB ($)", "linux_cost_per_memory_GiB", false, "linux"], 
        ["MSWin Cost Per Memory GiB ($)", "mswin_cost_per_memory_GiB", false, "mswin"], 
        ["Ephemeral Storage (GiB)", "storage_GiB", true, "all"],
        ["Linux Cost Per Storage GiB ($)", "linux_cost_per_storage_GiB", false, "linux"], 
        ["MSWin Cost Per Storage GiB ($)", "mswin_cost_per_storage_GiB", false, "mswin"], 
    ]
  end

  private 
  def set_region
    @region = params[:region] || 'us-east'
    @regions = Ec2Data.regions
  end 
end
