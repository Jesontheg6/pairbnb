 Rails.application.config.middleware.use OmniAuth::Builder do
      provider :facebook, '228690224192122', 'b46ed93828b77c2db74a9cb09dddabaa'
    end