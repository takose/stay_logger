require 'bundler'
Bundler.require
require 'sinatra/reloader' if development?
require 'sinatra/activerecord'
require 'sinatra/cross_origin'
require 'json'
require 'dotenv/load'

configure do
  enable :cross_origin
end

post '/callback' do
  data = JSON.parse(request.body.read)
  name = data["name"]
  event_name = data["event_name"]
  notifier = Slack::Notifier.new ENV['CALLBACK_URL'] do
    defaults channel: "#random",
      username: "appear_notifier"
  end
  notifier.ping "#{name} has #{event_name}!"
  {status: "enter"}.to_json
end
