require 'sinatra/base'
require 'sinatra/param'

require_relative 'routes/main'
require_relative 'helpers'

# Main app class
class CalcApp < Sinatra::Base
  helpers Sinatra::Param
  helpers Sinatra::CalcApp::Helpers

  register Sinatra::CalcApp::Routing::Main
end
