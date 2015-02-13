# Parser class which creates entities from JSON responses.
class EntityParser
  def self.parse_entity(data, class_name)
    entities = []
    Array(data).each do |entity_data|
      entities << class_name.new(entity_data)
    end
    entities
  end
end