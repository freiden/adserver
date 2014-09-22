class Campaign < ActiveRecord::Base
  belongs_to :advertiser

  scope :started, -> { where("start_date <= ?", DateTime.now.utc) }
  scope :not_finished, -> { where("end_date >= ?", DateTime.now.utc) }

  scope :active, -> {
    started.not_finished.where(in_pause: false)
  }

  def country_name
    country = ISO3166::Country[country_code]
    country.name
  end
end
