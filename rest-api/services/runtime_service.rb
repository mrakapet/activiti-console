module ActivitiRestApi

  class RuntimeService < ActivitiService

    SERVICE_URI_SUFFIX = '/runtime'

    def initialize(base_uri, credentials)
      super(base_uri, credentials)
    end

    def tasks
      result = get('/tasks')
      PaginatedArray.new(result, Task)
    end

    def process_instances
      result = get('/process-instances')
      PaginatedArray.new(result, ProcessInstance)
    end

  end

end