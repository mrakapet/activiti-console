class ActivitiException  < StandardError
  attr_reader :status_code, :error_message

  def initialize(status_code, error_message)
    @status_code = status_code
    @error_message = error_message
  end

  def to_s
    "#{@status_code} - #{@error_message}"
  end

end