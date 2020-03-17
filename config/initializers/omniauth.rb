Rails.application.config.middleware.use OmniAuth::Builder do
    provider :twitter, ENV['TWITTER_CONSUMER_KEY'], ENV['TWITTER_CONSUMER_SECRET'], callback_url: "https://pile-up.herokuapp.com//auth/:provider/callback"
  end