namespace :cache do 
  desc "clear the rails cache"
  task :clear_cache => :environment do 
    Rails.cache.clear
  end 
end 
