class SearchController < ApplicationController
  def index
    @members = MemberSearch.all_by_state(params[:state]).members



    state = params[:state]
    @conn = Faraday.new(url: "https://api.propublica.org") do |faraday|
      faraday.headers["X-API-KEY"] = ENV["PROPUBLICA_API_KEY"]
      faraday.adapter Faraday.default_adapter
    end

    response = @conn.get("/congress/v1/members/house/#{state}/current.json")

    @members = JSON.parse(response.body, symbolize_names: true)[:results].map do |raw_member|
      Member.new(raw_member)
    end
  end
end
