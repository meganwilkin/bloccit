require 'rails_helper'

RSpec.describe Advertisment, type: :model do

  let(:advertisment) { Advertisment.create!(title: "New Advertisment Title", body: "New Advertisment Body", price: 100) }

  describe "attributes" do
    it "has title and body and price attributes" do
      expect(advertisment).to have_attributes(title: "New Advertisment Title", body: "New Advertisment Body", price: 100)
    end
  end
end
