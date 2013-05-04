class Ec2Data

  class << self 
    def pricing 
      # this reads complex, but basically this is a poor man's client
      # result lets us look up prices like:
      # @pricing[region][api_type][api_size][OS] -> price($)/hour 
      # Ec2Data.pricing["us-east"]["stdODI"]["sm"]["linux"] -> 0.06
      @pricing ||= Hash[fetch_pricing["config"]["regions"].map{|r| 
        [r["region"], Hash[r["instanceTypes"].map{|e| 
          [e["type"], Hash[e["sizes"].map{|s| 
            [s["size"], Hash[s["valueColumns"].map{|p| 
              [p["name"], p["prices"]["USD"].to_f] 
            }]]
          }]] 
        }]]
      }]
    end 

    def regions 
      @regions ||= fetch_pricing()["config"]["regions"].map{|r| r["region"] }
    end 

    def fetch_pricing
      Rails.cache.fetch('pricing-on-demand-instances', :expires_in => 1.day, :race_condition_ttl => 1.minute) do 
        Rails.logger.info("Refreshing price cache")
        response = HTTParty.get('http://aws.amazon.com/ec2/pricing/pricing-on-demand-instances.json')
        Rails.logger.info("Refreshed: #{response.code}: #{response.message}")
        JSON.parse(response.body)
      end 
    end

    def type_specifications(region)
      Rails.cache.fetch("type-specificaions-#{region}", :expires_in => 1.day, :race_condition_ttl => 1.minute) do 
        Rails.logger.info("Refreshing ec2 type specificaions")
        Ec2TypeSpecification.all.map{|type_spec| type_spec.prices(region); type_spec }
      end 
    end 


  end 
end 
