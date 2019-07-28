class Value
  attr_accessor :id, :href, :metric, :owner, :value, :updated_at, :data
  include Hooplable
  
  class << self

    def find(id, metric_id)
      new(hoopla_client.get("/metrics/#{metric_id}/values/#{id}", method: 'get'))
    end

    def create(url, data)
      hoopla_client.post("#{url}/values".gsub('https://api.hoopla.net', ''), data)
    end
  
  end

  def user_id
    return nil if owner['kind'] != 'user'
    @user_id ||= owner['href'].gsub('https://api.hoopla.net/users/', '')
  end

  def user
    return nil if user_id.nil?
    @user ||= User.find(user_id)
  end

  def update_attributes(params)
    hoopla_client.put(href.gsub('https://api.hoopla.net', ''), data.merge(params))
  end

  private

  def set_id
    self.id = href.gsub("#{metric['href']}/values/", '')
  end
end
