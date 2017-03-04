Clearance.configure do |config|
  config.mailer_sender = "noreply@casvanderhoven.me"
  config.rotate_csrf_on_sign_in = true
  config.cookie_domain = ".heroku.com"
end
