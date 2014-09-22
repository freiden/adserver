module CampaignsHelper
  def formatted_currency(value)
    number_to_currency(value)
  end

  def formatted_datetime(datetime)
    datetime.strftime("%D")
  end
end
