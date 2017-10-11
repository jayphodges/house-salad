class MemberSearch

  def initialize(us_state)
    @us_state = us_state
  end

  def members
    raw_members = PropublicaService.new.filter_by_state(us_state)
    @members = raw_members.each do |raw_member|
      Member.new(raw_member)
    end

    conn = Faraday.new(url: "https://api.propublica.org") do |faraday|
      faraday.headers["X-API-KEY"] = ENV["PROPUBLICA_API_KEY"]
      faraday.adapter Faraday.default_adapter
    end

    response = conn.get("/congress/v1/members/house/#{us_state}/current.json")

    @members = JSON.parse(response.body, symbolize_names: true)[:results].map do |raw_member|
      Member.new(raw_member)
    end
  end

  private
    attr_reader :us_state

end
