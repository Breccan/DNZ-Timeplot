class DigitalNZ::Search
  #Takes a hash of params, and an optional custom_search title
  def initialize(params, custom_search = nil) 
    if custom_search
      url = "http://api.digitalnz.org/custom_searches/v1/#{custom_search}.json/?"
    else
      url = 'http://api.digitalnz.org/records/v1.json/?'
    end
    query = []
    for k,v in params
      query += [ k.to_s + '=' + CGI.escape(v) ]
    end
    url += query * "&"
    puts url
    res = fetch(url)
    res = JSON.parse(res.body)
    @orig = res
    @num_results_requestes = res['num_results_requested'] || nil
    @count = res['result_count'] || nil
    @start = res['start'] || nil
    @results = Array.new
    for r in res['results']
      @results << Result.new(r)
    end
  end

  def num_results_requested
    @num_results_requested
  end

  def count
    @count
  end

  def start
    @start
  end

  def results
    @results
  end

  def to_yaml
    @orig.to_yaml
  end

  class Result 

    def initialize(args)
      @args = args
      @category = args['category'] if args['category']
      @title = args['title'] if args['title']
      @content_provider = args['content_provider'] if args['content_provider']
      @date = DateTime.parse(args['date']) if (args['date'] and args['date'].size > 1)
      @syndication_date = DateTime.parse(args['syndication_date']) if args['syndication_date'] and args['syndication_date'].size
      @description = args['description'] if args['description']
      @id = args['id'] if args['id']
      @source_url = args['source_url'] if args['source_url']
      @display_url = args['display_url'] if args['display_url']
      @thumbnail_url = args['thumbnail_url'] if args['thumbnail_url']
      @metadata_url = args['metadata_url'] if args['metadata_url']
    end

    def category
      @category
    end

    def title
      @title
    end

    def content_provider
      @content_provider
    end

    def date
      @date
    end

    def syndication_date
      @syndication_date
    end

    def description
      @description
    end

    def display_url
      @display_url
    end

    def id
      @id
    end

    def metadata
      if !@metadata.nil?
        @metadata
      else 
        @metadata = DigitalNZ.record(@metadata_url) if @metadata_url
      end
    end

    def source_url
      @source_url
    end

    def thumbnail_url
      @thumbnail_url
    end

    def to_yaml
      @args.to_yaml
    end

    def to_json
      @args.to_json
    end

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

