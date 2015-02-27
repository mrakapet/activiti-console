require 'sinatra'

require_relative '../rest-api/activiti_rest_api'
require_relative '../rest-api/config/conf'

base_path = "http://#{Conf::HTTP[:host]}:#{Conf::HTTP[:port]}/#{Conf::HTTP[:api_path]}/"
service_factory = ActivitiRestApi::ServiceFactory.new(base_path, Conf::SECURITY)
repository_service = service_factory.create_repository_service
runtime_service = service_factory.create_runtime_service
management_service = service_factory.create_management_service

set :erb, layout: :layout

get '/' do
  erb :index
end

get '/deployments' do
  erb :deployments, locals: { deployments: repository_service.deployments }
end

get '/process-definitions' do
  erb :process_definitions, locals: { process_definitions: repository_service.process_definitions }
end

get '/tasks' do
  erb :tasks, locals: { tasks: runtime_service.tasks }
end

get '/jobs' do
  erb :jobs, locals: { jobs: management_service.jobs }
end

get '/process-instances' do
  erb :process_instances, locals: { process_instances: runtime_service.process_instances }
end
