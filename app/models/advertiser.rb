class Advertiser < ActiveRecord::Base
  belongs_to :user

  def country_name
    country = ISO3166::Country[country_code]
    country.name
  end

  def full_name
    "#{first_name.humanize} #{last_name.humanize}"
  end

  def full_address
    "#{address}, #{postcode} #{city}, #{country_code}"
  end
end
