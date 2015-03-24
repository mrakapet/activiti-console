module ActivitiRestApi

  # Parser class which creates entities from JSON responses.
  class EntityParser

    def self.parse_entity(data, class_name)
      # ap data
      class_name.new(data)
    end

    def self.parse_collection(data, class_name)
      PaginatedArray.new(data, class_name)
    end

  end # EntityParser
end # ActivitiRestApi