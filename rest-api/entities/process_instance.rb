module ActivitiRestApi

  # Entity class for process instance service.
  class ProcessInstance < Entity

    attribute :id, Integer
    attribute :url, String
    attribute :business_key, String
    attribute :suspended, Boolean
    attribute :process_definition_url, String
    attribute :activity_id, String
    attribute :tenant_id, String

  end # ProcessInstance
end # ActivitiRestApi