module ActivitiRestApi

  # Array used to store paginated data retrieved from Activiti services.
  class PaginatedArray

    include Enumerable
    attr_reader :sort, :total, :order, :start, :size

    def initialize(response_data, content)
      @total = response_data['total']
      @start = response_data['start']
      @size = response_data['size']
      @sort = response_data['sort']
      @order = response_data['order']
      @data = Array.wrap(response_data['data']).map do |item|
        EntityParser.parse_entity(item, content)
      end
    end

    def [](index)
      @data[index]
    end

    def each
      return to_enum(__method__) unless block_given?
      @data.each do |item|
        yield item
      end
    end

  end # PaginatedArray
end # ActivitiRestApi