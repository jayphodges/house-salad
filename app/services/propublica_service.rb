class PropublicaService

  def initialize
    @conn = Faraday.new(url: "https://api.propublica.org") do |faraday|
      faraday.headers["X-API-KEY"] = ENV["PROPUBLICA_API_KEY"]
      faraday.adapter Faraday.default_adapter
    end
  end

  def filter_by_state(us_state)
    response = conn.get("/congress/v1/members/house/#{us_state}/current.json")
    JSON.parse(response.body, symbolize_names: true)
  end

  private
  attr_reader :conn

end
