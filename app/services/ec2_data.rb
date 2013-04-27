class Ec2Data

  class << self 
    def pricing
      Rails.cache.fetch('pricing-on-demand-instances', :expires_in => 1.hour) do 
        Rails.logger.info("Refreshing price cache")
        response = HTTParty.get('http://aws.amazon.com/ec2/pricing/pricing-on-demand-instances.json')
        Rails.logger.info("Refreshed: #{response.code}: #{response.message}")
        JSON.parse(response.body)
      end 
    end

    def type_specifications 
      Rails.cache.fetch('type-specificaions', :expires_in => 24.hours) do 
        Rails.logger.info("Refreshing ec2 type specificaions")
        Ec2TypeSpecification.all
      end 
    end 

    def type_translation 
      {
        "m1.small" => ['stdODI', 'sm'],
        'm1.medium' => ['stdODI', 'med'],
        'm1.large' => ['stdODI', 'lg'],
        'm1.xlarge' => ['stdODI', 'xl'],
        't1.micro' => ['uODI', 'u'],
        'm2.xlarge' => ['hiMemODI', 'xl'],
        'm2.2xlarge' => ['hiMemODI', 'xxl'],
        'm2.4xlarge' => ['hiMemODI', 'xxxxl'],
        'c1.medium' => ['hiCPUODI', 'med'],
        'c1.xlarge' => ['hiCPUODI', 'xl'],
        'cc1.4xlarge' => ['clusterComputeI', 'xxxxl'],
        'cc2.8xlarge' => ['clusterComputeI', 'xxxxxxxxl'],
        'cg1.4xlarge' => ['clusterGPUI', 'xxxxl'],
        'hi1.4xlarge' => ['hiIoODI', 'xxxx1']
      }
    end 

    def region_translation 
      {
        'us-east-1' => 'us-east',
        'us-west-2' => 'us-west-2',
        'us-west-1' => 'us-west',
        'eu-west-1' => 'eu-ireland',
        'ap-southeast-1' => 'apac-sin',
        'ap-northeast-1' => 'apac-tokyo',
        'sa-east-1' => 'sa-east-1'
      }
    end 
  end 
end 
