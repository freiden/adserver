require 'countries'

class Campaign < ActiveRecord::Base
  belongs_to :advertiser

  scope :started, -> { where("start_date <= ?", DateTime.now.utc) }
  scope :not_finished, -> { where("end_date >= ?", DateTime.now.utc) }

  scope :active, -> {
    started.not_finished.where(in_pause: false)
  }

  scope :for_country, -> (country_code) {
    c = if country_code.match /^\w{2}$/
      country_code
    else
      Country.find_by_name(country_code).try(:first)
    end
   return none unless c
   where(country_code: c)
  }

  def country_name
    country = ISO3166::Country[country_code]
    country.name
  end
end
