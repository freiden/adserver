require 'rails_helper'

RSpec.describe Campaign, :type => :model do
  before(:each) do
    @campaign_ids = []
    (1..5).each do |n|
      campaign = FactoryGirl.build(:campaign)
      campaign.start_date = DateTime.now - n.days
      campaign.end_date = DateTime.now + 1.month + n.days
      campaign.save
      @campaign_ids << campaign.id
    end
  end

  it "should validate started scope result" do
    expect(Campaign.started.map(&:id)).to match_array(@campaign_ids)
  end

  it "should validate not_finished scope result" do
    expect(Campaign.not_finished.map(&:id)).to match_array(@campaign_ids)
  end

  it "should validate active scope result" do
    (1..3).each do |n|
      campaign = FactoryGirl.build(:campaign)
      campaign.in_pause = true
      campaign.save
    end
    expect(Campaign.active.map(&:id)).to match_array(@campaign_ids)
  end

  it "should validate for_country scope result" do
    (1..3).each do |n|
      campaign = FactoryGirl.build(:campaign)
      campaign.country_code = 'DE'
      campaign.save
    end
    expect(Campaign.for_country('France').map(&:id)).to match_array(@campaign_ids)
    expect(Campaign.for_country('FR').map(&:id)).to match_array(@campaign_ids)
  end
end
