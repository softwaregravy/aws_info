class AwsInstancesController < ApplicationController
  def index
    @pricing = Ec2Data.pricing
    @types = Ec2Data.type_specifications
  end
end
