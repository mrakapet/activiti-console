require 'sinatra'
require_relative '../rest-api/main'

set :erb, :layout => :layout

get '/' do
  erb :index
end

get '/deployments' do
  erb :deployments, :locals => { :deployments => get_deployments() }
end
