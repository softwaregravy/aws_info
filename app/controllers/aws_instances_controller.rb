class AwsInstancesController < ApplicationController
  def index
    @pricing = Ec2Data.pricing
    @types = Ec2Data.type_specifications
    @columns = Ec2TypeSpecification.accessible_attributes.select(&:present?).map {|attr| [attr.humanize, attr] }
  end
end
