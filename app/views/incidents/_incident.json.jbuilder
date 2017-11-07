json.extract! incident, :id, :code, :officer, :reason, :whenfound, :wherefound, :created_at, :updated_at
json.url incident_url(incident, format: :json)
