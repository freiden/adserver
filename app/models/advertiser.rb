class Advertiser < ActiveRecord::Base
  include NamingConcern
  include CountryNamingConcern

  belongs_to :user

  def full_address
    "#{address}, #{postcode} #{city}, #{country_code}"
  end
end
