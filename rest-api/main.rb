require 'net/http'
require 'json'

require_relative 'entities/deployment'

require 'awesome_print'

HOST = 'localhost'
PORT = '8080'
API_PATH = 'activiti-rest/service'

USERNAME = 'kermit'
PASSWORD = 'kermit'

DEPLOYMENTS_URI = 'repository/deployments'

def create_url(resource_url = '', query_params = {})
  uri = URI("http://#{HOST}:#{PORT}/#{API_PATH}/#{resource_url}")
  uri.query = URI.encode_www_form(query_params)
  uri
end

def get_deployments
  uri = create_url(DEPLOYMENTS_URI)

  req = Net::HTTP::Get.new(uri.request_uri)
  req.basic_auth(USERNAME, PASSWORD)
  req.content_type = 'application/json'
  req['Accept'] = 'application/json'
  res = Net::HTTP.start(uri.hostname, uri.port) do |http|
    http.request(req)
  end

  res.body = JSON.parse(res.body)

  Deployment.parse_all(res.body['data'])
end


# deployments = get_deployments
# puts "#{res.code} - #{res.message}"
# deployments.each { |d| d.to_s }

