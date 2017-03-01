require 'bundler'
Bundler.require
require 'sinatra/reloader' if development?
require 'sinatra/activerecord'
require 'sinatra/cross_origin'
require 'json'

configure do
  enable :cross_origin
end

post '/callback' do
  {status: "enter"}.to_json
end
