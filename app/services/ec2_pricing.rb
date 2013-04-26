class Ec2Pricing

  def self.pricing
    Rails.cache.fetch('pricing-on-demand-instances', :expires_in => 1.hour) do 
      Rails.logger.info("Refreshing price cache")
      response = HTTParty.get('http://aws.amazon.com/ec2/pricing/pricing-on-demand-instances.json')
      Rails.logger.info("Refreshed: #{response.code}: #{response.message}")
      JSON.parse(response.body)
    end 
  end

end 
