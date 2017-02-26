require 'bundler'
Bundler.require
require 'sinatra/reloader' if development?
require 'sinatra/cross_origin'
require 'json'

configure do
  enable :cross_origin
end

post '/callback' do
  #cross_origin
  #p body = request.body.read
  {status: "enter"}.to_json
end
