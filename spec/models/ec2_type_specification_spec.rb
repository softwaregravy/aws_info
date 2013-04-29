# == Schema Information
#
# Table name: ec2_type_specifications
#
#  id                         :integer          not null, primary key
#  name                       :string(255)
#  api_name                   :string(255)
#  api_type                   :string(255)
#  api_size                   :string(255)
#  memory                     :integer
#  compute_units              :integer
#  support_32_bit             :boolean
#  support_64_bit             :boolean
#  cores                      :integer
#  core_type                  :string(255)
#  ephemeral_drives           :integer
#  total_ephemeral_storage    :integer
#  ebs_optimization           :integer
#  io_performance             :string(255)
#  spot_available             :boolean
#  notes                      :string(255)
#  elastic_network_interfaces :integer
#  private_ip_per_eni         :integer
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#

require 'spec_helper'

describe Ec2TypeSpecification do
  pending "add some examples to (or delete) #{__FILE__}"
end
