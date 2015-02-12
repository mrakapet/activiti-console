require 'sinatra'
require_relative '../rest-api/main'

set :erb, :layout => :layout

get '/' do
  erb :index
end

get '/deployments' do
  erb :deployments, :locals => { :deployments => get_deployments }
end

get '/process-definitions' do
  erb :process_definitions, :locals => { :process_definitions => get_process_definitions}
end

get '/tasks' do
  erb :tasks, :locals => { :tasks => get_tasks }
end

get '/jobs' do
  erb :jobs, :locals => { :jobs => get_jobs }
end
