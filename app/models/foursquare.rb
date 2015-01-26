class Foursquare
  def self.query(params)
    uri = URI.parse("https://api.foursquare.com/v2/venues/explore?")
    uri.query = URI.encode_www_form(params)
    res = Net::HTTP.get_response(uri).body
    results = JSON.parse(res)
  end
end
