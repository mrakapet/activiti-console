require 'awesome_print'

class Job

  attr_reader :tenant_id, :execution_id, :due_date, :url, :exception_message, :process_definition_url, :execution_url, :id, :process_instance_url, :process_definition_id, :process_instance_id, :retries

  def initialize(data)
    @id = data['id']
    @url = data['url']
    @process_instance_id = data['processInstanceId']
    @process_instance_url = data['processInstanceUrl']
    @process_definition_id = data['processDefinitionId']
    @process_definition_url = data['processDefinitionUrl']
    @execution_id = data['executionId']
    @execution_url = data['executionUrl']
    @retries = data['retries']
    @exception_message = data['exceptionMessage']
    @due_date = data['dueDate']
    @tenant_id = data['tenantId']
  end

  def self.parse(hash)
    self.new(hash)
  end

  def self.parse_all(list)
    jobs = []
    list.each do |d|
      jobs << self.parse(d)
    end
    jobs
  end

  def to_s
    ap self
  end

end