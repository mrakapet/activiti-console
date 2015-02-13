require 'awesome_print'

# Entity class for deployment service.
class Deployment
  attr_accessor :tenant_id, :name, :url, :category, :id, :deployment_time

  def initialize(data)
    @id = data['id']
    @name = data['name']
    @deployment_time = data['deploymentTime']
    @category = data['category']
    @url = data['url']
    @tenant_id = data['tenantId']
  end

  def self.parse(hash)
    Deployment.new(hash)
  end

  def self.parse_all(list)
    deployments = []
    list.each do |d|
      deployments << Deployment.parse(d)
    end
    deployments
  end

  def to_s
    ap self
  end
end
