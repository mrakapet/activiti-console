module ActivitiRestApi

  class RepositoryService < ActivitiService

    SERVICE_URI_SUFFIX = '/repository'

    def initialize(base_uri, credentials)
      super(base_uri, credentials)
    end

    def deployments(query = {})
      result = get('/deployments', query)
      PaginatedArray.new(result, Deployment)
    end

    def process_definitions
      result = get('/process-definitions')
      PaginatedArray.new(result, ProcessDefinition)
    end

    def process_definition(process_definition_id)
      result = get("/process-definitions/#{process_definition_id}")
      ProcessDefinition.new(result)
    end

  end

end