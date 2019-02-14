class LocationService

  def initialize(ip_address)
    @ip = ip_address
  end

  def get_zip
    get_json("/#{@ip}?access_key=#{ENV['IPSTACK_API_KEY']}").zip
  end

  private

  def conn
    url = "http://api.ipstack.com"
    Faraday.new(url: url) do |faraday|
        faraday.adapter Faraday.default_adapter
    end
  end

  def get_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end
end
