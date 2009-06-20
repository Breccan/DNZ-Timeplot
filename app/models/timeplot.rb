class Timeplot < ActiveRecord::Base
  
  require 'ruby-debug'
  require 'xml/libxml'
  
  def self.fetch(uri_str, limit = 1000) 
    # You should choose better exception.
    raise ArgumentError, 'HTTP redirect too deep' if limit == 0

    response = Net::HTTP.get_response(URI.parse("http://api.digitalnz.org/records/v1.xml/?search_text=kittens&facets=year&api_key=387d16c7596c9cfff190d14a81ec189a"))
    case response
    when Net::HTTPSuccess     then response
    when Net::HTTPRedirection then fetch(response['location'], limit - 1)
    else
      response.error!
    end
    
    response = XML::Document.string(response.body)
    
    csv = self.response_to_csv(response)
    
    return csv
  end
  
  def self.response_to_csv(response)
      results = response.find('//date')  
      temp_array = []
      results.each do |result|
        unless result.content.empty?
          temp_array << result.content
        end
      end            
    return temp_array.to_csv
  end
end
