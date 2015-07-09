json.array!(@games) do |admin_game|
  json.extract! admin_game, :id
  json.url admin_game_url(admin_game, format: :json)
end
