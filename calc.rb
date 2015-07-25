require 'sinatra/base'
require 'sinatra/reloader'

require_relative 'routes/main'
require_relative 'helpers'

class CalcApp < Sinatra::Base
  register Sinatra::Reloader

  helpers Sinatra::CalcApp::Helpers
  
  register Sinatra::CalcApp::Routing::Main
end