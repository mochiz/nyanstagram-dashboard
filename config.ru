require 'dashing'
require 'dotenv'

Dotenv.load

configure do
  set :auth_token, 'YOUR_AUTH_TOKEN'

  helpers do
    def protected!
     # Put any authentication code you want in here.
     # This method is run before accessing any resource.
    end
  end
end

map Sinatra::Application.assets_prefix do
  run Sinatra::Application.sprockets
end

if ENV['BASIC_AUTH_USERNAME']
  use Rack::Auth::Basic do |username, password|
    username == ENV['BASIC_AUTH_USERNAME']
    password == ENV['BASIC_AUTH_PASSWORD']
  end
end

run Sinatra::Application
