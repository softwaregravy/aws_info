module ActiveSupport 
  module Inflector 
    @overrides = {
      /us/i => [/us/i, "US"],
      /eu/i => [/eu/i, "EU"],
      /sa/i => [/sa/i, "SA"],
      /apac/i => [/apac/i, "APac"],
    }
    alias :original_titleize :titleize
    def titleize(word)
      word = original_titleize(word)
      @overrides.each do |pattern, replacement|
        word.gsub!(replacement.first, replacement.second) if word =~ pattern
      end 
      word
    end 
  end 
end 
