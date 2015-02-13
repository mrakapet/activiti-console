# REST API configuration file.
module Conf
  HTTP = {
    host: 'localhost',
    port: '8080',
    api_path: 'activiti-rest/service'
  }
  SECURITY = {
    username: 'kermit',
    password: 'kermit'
  }
  ROUTING =  {
    deployments:            'repository/deployments',
    process_definitions:    'repository/process-definitions',
    tasks:                  'runtime/tasks',
    jobs:                   'management/jobs',
    process_instances:      'runtime/process-instances'
  }
end
