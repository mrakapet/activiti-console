module ActivitiRestApi

  # Super entity class
  class Entity
    include Virtus.model

    def to_s
      ap self
    end

  end

end