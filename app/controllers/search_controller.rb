class SearchController < ApplicationController
  def index
    @members = MemberSearch.new(params[:state]).members
  end



end
