Clearance.configure do |config|
  config.routes = false
  config.mailer_sender = "noreply@casvanderhoven.me"
  config.rotate_csrf_on_sign_in = true
  config.cookie_domain = ".heroku.com"
  config.allow_sign_up = false
end
