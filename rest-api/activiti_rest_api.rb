require 'httparty'
require 'awesome_print'

require_relative 'service_factory'
require_relative 'services/activiti_service'
require_relative 'services/repository_service'
require_relative 'services/runtime_service'
require_relative 'services/management_service'

require_relative 'errors'

require_relative 'entity_parser'
require_relative 'entities/deployment'
require_relative 'entities/process_definition'
require_relative 'entities/process_instance'
require_relative 'entities/job'
require_relative 'entities/task'

module ActivitiRestApi

  class ServiceFactory

  end

end