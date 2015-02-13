require 'awesome_print'
require_relative '../entity_parser'

# Entity class for process definition service.
class ProcessDefinition
  attr_reader :suspended, :key, :graphical_notation_defined, :resource,
              :version, :deployment_id, :name, :deployment_url, :url,
              :start_form_defined, :diagram_resource, :category, :id,
              :description

  def initialize(data)
    @id = data['id']
    @url = data['url']
    @version = data['version']
    @key = data['key']
    @category = data['category']
    @suspended = data['suspended']
    @name = data['name']
    @description = data['description']
    @deployment_id = data['deploymentId']
    @deployment_url = data['deploymentUrl']
    @graphical_notation_defined = data['graphicalNotationDefined']
    @resource = data['resource']
    @diagram_resource = data['diagramResource']
    @start_form_defined = data['startFormDefined']
  end

  def self.parse(data)
    EntityParser.parse_entity(data, self)
  end

  def to_s
    ap self
  end
end
