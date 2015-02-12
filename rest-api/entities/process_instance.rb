require 'awesome_print'

class ProcessInstance

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
    self.new(hash)
  end

  def self.parse_all(list)
    instance = []
    list.each do |d|
      instance << self.parse(d)
    end
    instance
  end

  def to_s
    ap self
  end

end