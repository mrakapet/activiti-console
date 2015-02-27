module ActivitiRestApi

  class ServiceFactory
    attr_reader :base_uri

    def initialize(base_uri, credentials)
      @base_uri = base_uri
      @credentials = credentials
      @services = {}
    end

    def create_repository_service
      create_service(RepositoryService)
    end

    protected
  
    def create_service(service_name)
      unless @services[service_name]
        @services[service_name] = service_name.new(@base_uri, @credentials)
      end
      @services[service_name]
    end

  end

end