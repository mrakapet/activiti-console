module ActivitiRestApi

  # Base class for all services of Activiti server.
  class ActivitiService
    include HTTParty

    SERVICE_URI_SUFFIX = '/'

    # default HTTP headers
    headers({
       'Content-Type' => 'application/json',
       'Accept' => 'application/json'
    })

    # default query parameters
    default_params({
      # sort: '',   # request specific
      # order: asc, # asc / desc
      # start: 0,   # 0
      # size: 10,   # 10
    })

    format :json

    def initialize(base_uri, credentials)
      self.class.base_uri(base_uri)
      self.class.basic_auth(credentials[:username], credentials[:password])
    end

    # HTTP GET
    def get(url, options={})
      perform_request(:get, url, options)
    end

    # HTTP POST
    def post(url, options={})
      perform_request(:post, url, options)
    end

    # HTTP PUT
    def put(url, options={})
      perform_request(:put, url, options)
    end

    # HTTP DELETE
    def delete(url, options={})
      perform_request(:delete, url, options)
    end

    protected

    # Perform chosen request type.
    def perform_request(http_method, url, options = {})
      # do request
      begin
        request_uri = "#{self.class::SERVICE_URI_SUFFIX}/#{url}".gsub(/[\/]+/, '/')
        response = self.class.send(http_method, request_uri, options)
        response_body = response.parsed_response
      rescue JSON::JSONError # catches errors when parsing response
        response_body = nil
      rescue HTTParty::Error => e # catches connection and other technical errors
        raise Errors::ResponseError.new(e.message, nil, e)
      end

      # response.class is now HTTParty::Response

      # check HTTP and format errors
      unless response_body.is_a?(Hash)  # its not valid JSON response
        if error_code?(response.code) # HTTP error occurred
          raise Errors::ResponseError.new(response.response.message, response.code)
        else
          raise Errors::UnsupportedFormatError.new('JSON response expected.', response.code)
        end
      end

      # check Activiti engine errors
      if error_code?(response.code)
        raise Errors::OperationFailedError.new(response_body['message'], response_body['exception'], response.code)
      end

      # if response body is empty -> return nil
      return nil if response.body.empty?

      # return result as a hash in common Ruby format
      underscore(response_body)
    end

    # Check if given HTTP status code is a HTTP error code.
    def error_code?(status_code)
      !(200...300).include?(status_code)
    end

    # Transforms all keys of given Hash/Array from camelCase to snake_case Strings
    def underscore(data)
      if data.is_a?(Array)
        return data.map do |item|
          underscore(item)
        end
      end
      if data.is_a?(Hash)
        hash = {}
        data.each do |key, value|
          hash[key.to_s.underscore] = underscore(value)
        end
        return hash
      end
      data
    end

  end # ActivitiService
end # ActivitiRestApi