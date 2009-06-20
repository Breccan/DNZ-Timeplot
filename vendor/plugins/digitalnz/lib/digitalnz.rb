module DigitalNZ

  @@api_key = 0

  def self.api_key
    @@api_key
  end

  def self.api_key=(x)
    @@api_key = x
  end

  def self.search(params)
    params = { :search_text => params.to_s } unless params.is_a?(Hash)
    params[:api_key]=@@api_key
    DigitalNZ::Search.new(params)
  end

  def self.record(url)
    DigitalNZ::Record.new(url)
  end

end

def require_local(suffix)
  require(File.expand_path(File.join(File.dirname(__FILE__), suffix)))
end

# External requires
require('rubygems')
require('net/http')
require('uri')
require('json')
require('cgi')

# Local requires.
require_local('digitalnz/search')
require_local('digitalnz/record')
require_local('digitalnz/version')
