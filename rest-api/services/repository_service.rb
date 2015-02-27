module ActivitiRestApi

  class RepositoryService < ActivitiService

    SERVICE_URI_SUFFIX = '/repository'

    def initialize(base_uri, credentials)
      super(base_uri, credentials)
    end

    def deployments
      result = get('/deployments')
      EntityParser.parse_all(result['data'], Deployment)
    end

    def process_definitions
      result = get('/process-definitions')
      EntityParser.parse_all(result['data'], ProcessDefinition)
    end

    def process_definition(process_definition_id)
      result = get("/process-definitions/#{process_definition_id}")
      EntityParser.parse_one(result, ProcessDefinition)
    end

  end

end