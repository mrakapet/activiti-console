require 'net/http'
require 'json'

# HTTP Request class which performs requests to Activiti REST API.
class Request
  def self.create_url(resource_url = '', query_params = {})
    uri = URI("http://#{Conf::HTTP[:host]}:#{Conf::HTTP[:port]}/#{Conf::HTTP[:api_path]}/#{resource_url}")
    uri.query = URI.encode_www_form(query_params)
    uri
  end

  def self.do_get(url)
    uri = Request.create_url(url)

    req = Net::HTTP::Get.new(uri.request_uri)
    req.basic_auth(Conf::SECURITY[:username], Conf::SECURITY[:password])
    req.content_type = 'application/json'
    req['Accept'] = 'application/json'
    res = Net::HTTP.start(uri.hostname, uri.port) do |http|
      http.request(req)
    end

    puts "#{res.body}"
    res.body = JSON.parse(res.body)
    res
  end
end
