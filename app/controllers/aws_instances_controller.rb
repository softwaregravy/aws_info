class AwsInstancesController < ApplicationController
  def index
    @pricing = Ec2Pricing.pricing
  end
end
