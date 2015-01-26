class Foursquare
  def self.get_places location, query
    params = {  near: location,
                query: query,
                openNow: '1',
                price: '1,2'
                }
    response = self.query(params)
    response['response']['groups'].first['items']
  end

  def self.query(params)
    params.merge!({
      client_id: ENV['FOURSQUARE_KEY'],
      client_secret: ENV['FOURSQUARE_SECRET'],
      v: '20130815',
      m: 'foursquare'
    })

    uri = URI.parse("https://api.foursquare.com/v2/venues/explore")
    uri.query = URI.encode_www_form(params)
    puts uri.query
    res = Net::HTTP.get_response(uri).body
    results = JSON.parse(res)
  end
end
