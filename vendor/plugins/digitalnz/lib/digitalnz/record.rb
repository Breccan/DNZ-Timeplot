class DigitalNZ::Record

  def initialize(url)
    query = [ "api_key=" + CGI.escape(DigitalNZ.api_key) ]
    url += ".json?" + query * "&"
    puts url
    res = fetch(url)
    res = JSON.parse(res.body)
    puts res.to_yaml
  end

  def id
    @id
  end

  def url
    @url
  end

  private

  def fetch(uri_str, limit = 10) 
    # You should choose better exception.
    raise ArgumentError, 'HTTP redirect too deep' if limit == 0

    response = Net::HTTP.get_response(URI.parse(uri_str))
    case response
    when Net::HTTPSuccess     then response
    when Net::HTTPRedirection then fetch(response['location'], limit - 1)
    else
      response.error!
    end
  end

end
