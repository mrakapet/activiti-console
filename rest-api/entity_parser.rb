# Parser class which creates entities from JSON responses.
class EntityParser
  def self.parse_entity(data, class_name)
    self.parse_all(data, class_name)
  end

  def self.parse_one(hash_data, class_name)
    class_name.new(hash_data)
  end

  def self.parse_all(data, class_name)
    entities = []
    data = [data] unless data.is_a?(Array)
    data.each do |entity_data|
      entities << self.parse_one(entity_data, class_name)
    end
    entities
  end

end
