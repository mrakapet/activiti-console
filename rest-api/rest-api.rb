require_relative 'config/conf'
require_relative 'http/request'
require_relative 'entities/deployment'
require_relative 'entities/process_definition'
require_relative 'entities/task'
require_relative 'entities/job'
require_relative 'entities/process_instance'
require 'awesome_print'

def deployments
  res = Request.do_get(Conf::ROUTING[:deployments])
  Deployment.parse_all(res.body['data'])
end

def process_definitions
  res = Request.do_get(Conf::ROUTING[:process_definitions])
  ProcessDefinition.parse_all(res.body['data'])
end

def tasks
  res = Request.do_get(Conf::ROUTING[:tasks])
  Task.parse_all(res.body['data'])
end

def jobs
  res = Request.do_get(Conf::ROUTING[:jobs])
  Job.parse_all(res.body['data'])
end

def process_instances
  res = Request.do_get(Conf::ROUTING[:process_instances])
  ProcessInstance.parse_all(res.body['data'])
end

# ap deployments
# ap process_definitions
# ap tasks
# ap jobs
# ap process_instances
