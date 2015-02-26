require_relative 'activiti_service'

class RepositoryService < ActivitiService

  SERVICE_URI_SUFFIX = '/repository/'

  def initialize(base_uri, credentials)
    super(base_uri << SERVICE_URI_SUFFIX, credentials)
  end

  def process_definitions
    perform_request(:get,  '/process-definitions')
  end

  def process_definition(process_definition_id)
    perform_request(:get, "/process-definitions/#{process_definition_id}")
  end

end
