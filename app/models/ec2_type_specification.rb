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

end
