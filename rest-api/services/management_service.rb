module ActivitiRestApi

  class ManagementService < ActivitiService

    SERVICE_URI_SUFFIX = '/management'

    def initialize(base_uri, credentials)
      super(base_uri, credentials)
    end

    def jobs
      result = get('/jobs')
      PaginatedArray.new(result, Job)
    end

  end

end