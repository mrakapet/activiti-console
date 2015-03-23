module ActivitiRestApi

  # Entity class for job service.
  class Job < Entity

    attribute :id, Integer
    attribute :url, String
    attribute :process_instance_id, Integer
    attribute :process_definition_url, String
    attribute :process_definition_id, String
    attribute :process_definition_url, String
    attribute :execution_id, Integer
    attribute :execution_url, String
    attribute :retries, Integer
    attribute :exception_message, String
    attribute :due_date, DateTime
    attribute :tenant_id, String

  end # Job
end # ActivitiRestApi