require 'net/http'
require 'json'

require_relative 'entities/deployment'
require_relative 'entities/process_definition'
require_relative 'entities/task'
require_relative 'entities/job'

require 'awesome_print'

HOST = 'localhost'
PORT = '8080'
API_PATH = 'activiti-rest/service'

USERNAME = 'kermit'
PASSWORD = 'kermit'

DEPLOYMENTS_URI = 'repository/deployments'
PROCESS_DEFINITIONS_URI = 'repository/process-definitions'
TASKS_URI = 'runtime/tasks'
JOBS_URI = 'management/jobs'

def create_url(resource_url = '', query_params = {})
  uri = URI("http://#{HOST}:#{PORT}/#{API_PATH}/#{resource_url}")
  uri.query = URI.encode_www_form(query_params)
  uri
end

def do_http_get(url)
  uri = create_url(url)

  req = Net::HTTP::Get.new(uri.request_uri)
  req.basic_auth(USERNAME, PASSWORD)
  req.content_type = 'application/json'
  req['Accept'] = 'application/json'
  res = Net::HTTP.start(uri.hostname, uri.port) do |http|
    http.request(req)
  end

  res.body = JSON.parse(res.body)
  res
end

def get_deployments
  res = do_http_get(DEPLOYMENTS_URI)

  Deployment.parse_all(res.body['data'])
end

def get_process_definitions
  res = do_http_get(PROCESS_DEFINITIONS_URI)

  ProcessDefinition.parse_all(res.body['data'])
end

def get_tasks
  res = do_http_get(TASKS_URI)
  Task.parse_all(res.body['data'])
end

def get_jobs
  res = do_http_get(JOBS_URI)
  Job.parse_all(res.body['data'])
end


# ap get_deployments
# ap get_process_definitions
# ap get_tasks
ap get_jobs
