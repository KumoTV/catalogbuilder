json.array!(@encoding_profiles) do |encoding_profile|
  json.extract! encoding_profile, :id, :preset_id, :name, :description
  json.url encoding_profile_url(encoding_profile, format: :json)
end
