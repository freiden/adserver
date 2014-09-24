require 'rails_helper'

RSpec.describe User, :type => :model do
  context "by default" do
    it "should valid full_name format" do
      user = FactoryGirl.build(:user)
      expect(user).to receive(:first_name).twice.and_return('jane')
      expect(user).to receive(:last_name).twice.and_return('doe')
      expect(user.full_name).to eql("#{user.first_name.humanize} #{user.last_name.humanize}")
    end
  end

  context "with role user" do
    it "should not have any errors" do
      user = FactoryGirl.build(:user)
      user.save
      expect(user.errors.full_messages).to eq([])
      expect(user.user?).to be_truthy
      expect(user.administrator?).to be_falsy
    end
  end

  context "with role administrator" do
    it "not should have any errors" do
      administrator = FactoryGirl.build(:administrator)
      administrator.save
      expect(administrator.errors.full_messages).to eq([])
      expect(administrator.administrator?).to be_truthy
      expect(administrator.user?).to be_falsy
    end
  end
end
