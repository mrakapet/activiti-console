require 'awesome_print'

class Task

  attr_reader :tenant_id, :suspended, :execution, :task_definitionKey, :delegation_state, :name, :process_definition, :priority, :assignee, :create_time, :due_date, :url, :process_instance, :id, :description, :parent_task, :owner

  def initialize(data)
    @assignee = data['assignee'] 
    @create_time = data['createTime']
    @delegation_state = data['delegationState']
    @description = data['description'] 
    @due_date = data['dueDate']
    @execution = data['execution'] 
    @id = data['id'] 
    @name = data['name'] 
    @owner = data['owner'] 
    @parent_task = data['parentTask']
    @priority = data['priority'] 
    @process_definition = data['processDefinition']
    @process_instance = data['processInstance']
    @suspended = data['suspended'] 
    @task_definitionKey = data['taskDefinitionKey']
    @url = data['url'] 
    @tenant_id = data['tenantId']
  end

  def self.parse(hash)
    self.new(hash)
  end

  def self.parse_all(list)
    tasks = []
    list.each do |d|
      tasks << self.parse(d)
    end
    tasks
  end

  def to_s
    ap self
  end

end