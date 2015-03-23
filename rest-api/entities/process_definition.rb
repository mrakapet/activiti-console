module ActivitiRestApi

  # Entity class for process definition service.
  class ProcessDefinition < Entity

    attribute :id, String
    attribute :url, String
    attribute :version, Integer
    attribute :key, String
    attribute :category, String
    attribute :suspended, Axiom::Types::Boolean
    attribute :name, String
    attribute :description, String
    attribute :deployment_id, Integer
    attribute :deployment_url, String
    attribute :graphical_notation_defined, Boolean
    attribute :resource, String
    attribute :diagram_resource, String
    attribute :start_form_defined, Boolean

  end # ProcessDefinition
end # ActivitiRestApi