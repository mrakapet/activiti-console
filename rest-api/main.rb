require_relative 'config/conf'
require_relative 'activiti_rest_api'
require_relative 'entities/process_definition'

opt = {
    query: {
        size: 2
    }
}

base_path = "http://#{Conf::HTTP[:host]}:#{Conf::HTTP[:port]}/#{Conf::HTTP[:api_path]}/"
service_factory = ActivitiRestApi::ServiceFactory.new(base_path, Conf::SECURITY)
repository_service = service_factory.create_repository_service
# repository_service = RepositoryService.new(base_path, Conf::SECURITY)
# res = repository_service.do_request('/repository/process-definitions', opt)
# res = repository_service.process_definitions

# ap res.body
# ap "#{res.code} - #{res.message}"

res = repository_service.process_definition('createTimersProcess:1:36')   # 36
ap res
res = ProcessDefinition.parse(res)
ap res

