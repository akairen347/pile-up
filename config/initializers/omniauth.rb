Rails.application.config.middleware.use OmniAuth::Builder do
	provider :twitter, ENV['At9i5eUDGCWOHtds3yCmQnl8U'], ENV['DAv88lsRRUBwNBWAdPiVKeEYM2QxP6uZHTtjIIk2V50HlwooOO']
end