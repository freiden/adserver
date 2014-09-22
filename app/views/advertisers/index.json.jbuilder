json.array!(@advertisers) do |advertiser|
  json.extract! advertiser, :id
  json.url advertiser_url(advertiser, format: :json)
end
