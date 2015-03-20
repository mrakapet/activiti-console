# Parser class which creates entities from JSON responses.
class EntityParser
  def self.parse_entity(data, class_name)
    self.parse_all(data, class_name)
  end

  def self.parse_one(hash_data, class_name)
    class_name.new(hash_data)
  end

  def self.parse_all(data, class_name)
    Array.wrap(data).map do |entity_data|
      self.parse_one(entity_data, class_name)
    end
  end

end
