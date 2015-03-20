module ActivitiRestApi

  # List of all Activiti REST API errors.
  module Errors

    # Base Activiti REST API error class.
    class ActivitiError < StandardError

      # 'previous' attribute is a link to previously raised Exception.
      attr_reader :status_code, :previous

      def initialize(msg = 'Activiti REST API error.', status_code = nil, previous = nil)
        unless previous.nil? || previous.is_a?(Exception)
          raise InvalidArgumentError, "Constructor argument 'previous' has to be subclass of 'Exception'. '#{previous.class}' class given."
        end
        @status_code = status_code
        @previous = previous
        super(msg)
      end

    end

    # This Error reflects HTTP, communication, configuration and other faults.
    class ResponseError < ActivitiError; end

    # This error is raised when a response is not in JSON format.
    class UnsupportedFormatError < ActivitiError; end

    # OperationFailedError is raised when the HTTP request is correct but
    # the Activiti engine can not perform requested operation. Activiti engine
    # provides JSON response with detailed error message.
    class OperationFailedError < ActivitiError

      alias :activiti_exception :message
      attr_reader :activiti_message

      def initialize(activiti_message, activiti_exception, status_code = nil)
        activiti_message[0] = activiti_message[0].upcase
        activiti_exception[0] = activiti_exception[0].upcase
        @activiti_message = activiti_message
        activiti_exception[0] = activiti_exception[0].upcase
        super(activiti_exception, status_code)
      end

    end

    # Is raised if the JSON response does not include required data.
    class ParseError < ActivitiError; end

    # InvalidArgumentError is raised when wrong arguments are passed to
    # ActivitiService method. Error is raised before any HTTP communication is done.
    class InvalidArgumentError < ActivitiError; end

  end

end