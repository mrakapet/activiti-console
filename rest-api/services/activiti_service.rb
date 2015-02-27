module ActivitiRestApi

  # Base class for all services of Activiti server.
  class ActivitiService
    include HTTParty

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

    def initialize(base_uri, credentials)
      self.class.base_uri(base_uri)
      self.class.basic_auth(credentials[:username], credentials[:password])
    end

    # HTTP GET
    def get(url, options={}, desired_status_code = 200)
      perform_request(:get, url, options, desired_status_code)
    end

    # HTTP POST
    def post(url, options={}, desired_status_code = 201)
      perform_request(:post, url, options, desired_status_code)
    end

    # HTTP PUT
    def put(url, options={}, desired_status_code = 200)
      perform_request(:put, url, options, desired_status_code)
    end

    # HTTP DELETE
    def delete(url, options={}, desired_status_code = 204)
      perform_request(:delete, url, options, desired_status_code)
    end

    protected

    # Perform chosen request type.
    def perform_request(http_method, url, options = {}, desired_status_code)
      # do request
      begin
        response = self.class.send(http_method, url, options)
        parsed_response = response.parsed_response
      rescue => e # catch connection or other technical errors
        fail 'Request failed: ' << e.message
      end

      # response.class is now HTTParty::Response

      # catch standard HTTP errors
      unless parsed_response.is_a?(Hash)
        raise "HTTP Error #{response.code}" # if HTML error reason can be found in the title of HTML page
      end

      # catch Activiti exceptions
      if response.code != desired_status_code
        raise ActivitiException, "HTTP Error #{response.code} - #{response['message']} - #{response['exception']}"
      end

      # TODO Parse Hash into entity / collection of entities

      parsed_response
    end

  end

end