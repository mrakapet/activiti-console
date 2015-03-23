# Parser class which creates entities from JSON responses.
class EntityParser

  def self.parse_one(hash_data, class_name)
    # ap hash_data
    class_name.new(self.underscore_keys(hash_data))
  end

  def self.parse_all(data, class_name)
    Array.wrap(data).map do |entity_data|
      self.parse_one(entity_data, class_name)
    end
  end

  protected

  def self.underscore_keys(hash)
    data = {}
    hash.each do |key, value|
      data[key.to_s.underscore] = (value.nil? ? '' : value)
    end
    data
  end

end
