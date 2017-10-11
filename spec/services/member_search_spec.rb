require 'rails_helper'

describe MemberSearch do
  context "class methods" do
    context ".initialize(us_state)" do
      it "returns a valid object" do
        search = MemberSearch.new('CO')

        expect(search).to be_a MemberSearch
      end
    end
  end
  context "intance methods" do
    let(:search) { MemberSearch.new('CO') }

    context "#members" do
      it "returns a lit of members with a valid state" do
        expect(search.members.count).to eq(7)
      end

    end
  end
end
