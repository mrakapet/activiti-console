module ActivitiRestApi

  class RuntimeService < ActivitiService

    SERVICE_URI_SUFFIX = '/runtime'

    def initialize(base_uri, credentials)
      super(base_uri, credentials)
    end

    def tasks
      result = get('/tasks')
      EntityParser.parse_collection(result, Task)
    end

    def process_instances
      result = get('/process-instances')
      EntityParser.parse_collection(result, ProcessInstance)
    end

  end

end