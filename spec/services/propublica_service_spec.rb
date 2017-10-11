require "rails_helper"

describe PropublicaService do
  context "class methods" do
    context ".initialize" do
      it "exits" do
        expect(PropublicaService.new).to be_a PropublicaService
      end
    end
  end
  context "instance methods" do
    context "#filter_by_state(us_state)" do
      it "returns an array of hashes with proper structure" do
        raw_members = PropublicaService.new.filter_by_state("CO")
        expect(raw_members.count).to eq(7)
        expect(raw_member).to be_a Hash
        expect(raw_member).to have_key :role
        expect(raw_member).to have_key :party
        expect(raw_member).to have_key :district
        expect(raw_member).to have_key :seniority

      end
    end
  end
end
