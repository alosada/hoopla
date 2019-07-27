class Metric
  attr_accessor :id, :href, :name, :type, :format_rounded_to, :currency_code, :updated_at, :links, :data
  include Hooplable
  
  class << self
    def all
      all_unmodified.map {|data| new(data)}
    end

    def find(id)
      new(hoopla_client.get("metrics/#{id}", method: 'get'))
    end
  
    private
  
    def all_unmodified
      hoopla_client.get('metrics', method: 'get')
    end

  end

  def values
    hoopla_client.get("metrics/#{id}/values", method: 'get')
  end

  private

  def set_id
    self.id = href.gsub('https://api.hoopla.net/metrics/', '')
  end
end
