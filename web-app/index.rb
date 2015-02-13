require 'sinatra'
require_relative '../rest-api/rest-api'

set :erb, layout: :layout

get '/' do
  erb :index
end

get '/deployments' do
  erb :deployments, locals: { deployments: deployments }
end

get '/process-definitions' do
  erb :process_definitions, locals: { process_definitions: process_definitions }
end

get '/tasks' do
  erb :tasks, locals: { tasks: tasks }
end

get '/jobs' do
  erb :jobs, locals: { jobs: jobs }
end

get '/process-instances' do
  erb :process_instances, locals: { process_instances: process_instances }
end
