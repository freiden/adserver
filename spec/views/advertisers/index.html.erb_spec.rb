require 'rails_helper'

RSpec.describe "advertisers/index", :type => :view do
  before(:each) do
    assign(:advertisers, [
      Advertiser.create!(),
      Advertiser.create!()
    ])
  end

  it "renders a list of advertisers" do
    render
  end
end
