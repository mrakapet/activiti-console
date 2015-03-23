module ActivitiRestApi

  # Entity class for deployment service.
  class Deployment < Entity

    attribute :id, Integer
    attribute :name, String
    attribute :deployment_time, DateTime
    attribute :category, String
    attribute :url, String
    attribute :tenant_id, String

  end # Deployment
end # ActivitiRestApi