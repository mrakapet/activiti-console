module ActivitiRestApi

  # Entity class for task service.
  class Task < Entity

    attribute :assignee, String
    attribute :create_time, DateTime
    attribute :delegation_state, String
    attribute :description, String
    attribute :due_date, DateTime
    attribute :execution, String
    attribute :id, Integer
    attribute :name, String
    attribute :owner, String
    attribute :parent_task, String
    attribute :priority, Integer
    attribute :process_definition, String
    attribute :process_instance, String
    attribute :suspended, Boolean
    attribute :task_definition_key, String
    attribute :url, String
    attribute :tenant_id, String

  end # Task
end # ActivitiRestApi