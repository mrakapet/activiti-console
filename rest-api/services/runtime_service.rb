module ActivitiRestApi

  class RuntimeService < ActivitiService

    SERVICE_URI_SUFFIX = '/runtime'

    def initialize(base_uri, credentials)
      super(base_uri, credentials)
    end

    def tasks
      result = get('/tasks')
      EntityParser.parse_all(result['data'], Task)
    end

    def process_instances
      result = get('/process-instances')
      EntityParser.parse_all(result['data'], ProcessInstance)
    end

  end

end