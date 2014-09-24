require 'rails_helper'

RSpec.describe Advertiser, :type => :model do
  before(:each) do
    @advertiser = FactoryGirl.build(:advertiser)
  end
  it "should validate full_name format" do
    expect(@advertiser).to receive(:first_name).at_least(:once).and_return('peter')
    expect(@advertiser).to receive(:last_name).at_least(:once).and_return('parker')
    expect(@advertiser.full_name).to eql("#{@advertiser.first_name.humanize} #{@advertiser.last_name.humanize}")
  end

  it "should validate expect country name" do
    country_code = 'DE'
    expect(@advertiser).to receive(:country_code).and_return(country_code)
    expect(@advertiser.country_name).to eql(ISO3166::Country[country_code].name)
  end

  it "should validate format of full address" do
    address = "2 rue Ste Anne"
    postcode = "75001"
    city = "Paris"
    country_code = 'FR'
    expect(@advertiser).to receive(:address).at_least(:once).and_return(address)
    expect(@advertiser).to receive(:postcode).at_least(:once).and_return(postcode)
    expect(@advertiser).to receive(:city).at_least(:once).and_return(city)
    expect(@advertiser).to receive(:country_code).at_least(:once).and_return(country_code)
    expect(@advertiser.full_address).to eql("#{address}, #{postcode} #{city}, #{country_code}")
  end
end
