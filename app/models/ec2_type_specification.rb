# == Schema Information
#
# Table name: ec2_type_specifications
#
#  id                      :integer          not null, primary key
#  name                    :string(255)
#  api_name                :string(255)
#  api_type                :string(255)
#  api_size                :string(255)
#  memory                  :integer
#  compute_units           :integer
#  support_32_bit          :boolean
#  support_64_bit          :boolean
#  cores                   :integer
#  core_type               :string(255)
#  ephemeral_drives        :integer
#  total_ephemeral_storage :integer
#  ebs_optimization        :integer
#  io_performance          :string(255)
#  max_ips                 :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

class Ec2TypeSpecification < ActiveRecord::Base
  attr_accessible :api_name, :api_size, :api_type, :cores, :core_type, :compute_units, :ebs_optimization, 
    :ephemeral_drives, :io_performance, :max_ips, :memory, :name, :support_32_bit, :support_64_bit, 
    :total_ephemeral_storage

  def architecture 
    return "32-bit" if support_32_bit && !support_64_bit
    return "32-bit/64-bit" if support_32_bit && support_64_bit
    return "64-bit" if !support_32_bit && support_64_bit
  end 

  def memory_GiB
    memory / 1.gigabyte 
  end 

  def storage_GiB
    total_ephemeral_storage / 1.gigabyte 
  end 

  def prices(region = 'us-east')
    @prices ||= Ec2Data.pricing[region][api_type][api_size]
  end 

  # Ec2TypeSpecification.last.public_methods(false).select{|m| m.to_s.match(/^linux|^mswin/)}
  # [:mswin_cost_per_storage_GiB, :linux_cost_per_memory_GiB, :linux_cost_per_cores, :linux_cost_per_storage_GiB, 
  # :mswin_cost_per_ebs_optimization, :mswin_cost_per_ephemeral_drives, :mswin_cost_per_cores, :mswin_cost_per_compute_units, 
  # :mswin_cost_per_memory_GiB, :mswin_cost_per_hour, :linux_cost_per_ephemeral_drives, :mswin_cost_per_max_ips, 
  # :linux_cost_per_compute_units, :linux_cost_per_ebs_optimization, :linux_cost_per_hour, :linux_cost_per_max_ips]
  ["linux", "mswin"].each do |os|
    define_method "#{os}_cost_per_hour" do 
      prices[os]
    end 

    ["memory_GiB", "compute_units", "cores", "ephemeral_drives", "ebs_optimization", "storage_GiB", "max_ips"].each do |attr|
      define_method "#{os}_cost_per_#{attr}" do 
        send("#{os}_cost_per_hour") / send(attr)
      end 
    end 
  end 
end 
