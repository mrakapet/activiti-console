require 'httparty'
require 'json'

require_relative 'activiti_exception'

class ActivitiService
  include HTTParty

  headers({
     'Content-Type' => 'application/json',
     'Accept' => 'application/json'
  })

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

  def perform_request(method, url, options = {}, desired_status_code = 200)
    begin
      response = self.class.send(method, url, options)
      response.body = JSON.parse(response.body) # can raise JSON::JSONError
        # rescue JSON::JSONError => json_error
        #     fail 'Invalid response format.'
    rescue Exception => e
      puts e.message
      fail 'Request failed.'
    end

    if response.code != desired_status_code
      if response.body['statusCode'] && response.body['errorMessage']
        raise ActivitiException.new(response.body['statusCode'], response.body['errorMessage'])
      else
        raise 'Invalid format of Activiti error response.' << response.body.to_s
      end
    end

    response
  end

end
