require 'awesome_print'

class Deployment

  attr_accessor :tenant_id, :name, :url, :category, :id, :deployment_time

  def initialize(id, name, deployment_time, category, url, tenant_id)
    @id = id
    @name = name
    @deployment_time = deployment_time
    @category = category
    @url = url
    @tenant_id = tenant_id
  end

  def self.parse(hash)
    Deployment.new(hash['id'], hash['name'], hash['deploymentTime'], hash['category'], hash['url'], hash['tenantId'])
  end

  def self.parse_all(list)
    deployments = []
    list.each do |d|
      deployments << Deployment.new(d['id'], d['name'], d['deploymentTime'], d['category'], d['url'], d['tenantId'])
    end
    deployments
  end

  def to_s
    ap self
  end

end