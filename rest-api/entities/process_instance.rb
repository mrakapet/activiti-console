require 'awesome_print'

# Entity class for process instance service.
class ProcessInstance
  attr_reader :tenant_id, :suspended, :business_key, :activity_id, :url,
              :process_definition_url, :id

  def initialize(data)
    @id = data['id']
    @url = data['url']
    @business_key = data['businessKey']
    @suspended = data['suspended']
    @process_definition_url = data['processDefinitionUrl']
    @activity_id = data['activityId']
    @tenant_id = data['tenantId']
  end

  def self.parse(hash)
    new(hash)
  end

  def self.parse_all(list)
    instance = []
    list.each do |d|
      instance << parse(d)
    end
    instance
  end

  def to_s
    ap self
  end
end
