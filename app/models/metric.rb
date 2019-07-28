class Metric
  attr_accessor :id, :href, :name, :type, :format_rounded_to, :currency_code, :updated_at, :links, :data
  include Hooplable
  
  class << self
    def all
      all_raw.map {|data| new(data)}
    end

    def find(id)
      new(hoopla_client.get("metrics/#{id}", method: 'get'))
    end
  
    private
  
    def all_raw
      hoopla_client.get('metrics', method: 'get')
    end

  end

  def values
    @values ||= values_raw.map {|data| Value.new(data)}
  end

  def user_value_hash
    @user_value_hash ||= values_raw.map do |data|
      value = Value.new(data)
      [value.user_id, value]
    end.to_h
  end

  private

  def values_raw
    hoopla_client.get("metrics/#{id}/values", method: 'get')
  end

  def set_id
    self.id = href.gsub('https://api.hoopla.net/metrics/', '')
  end
end
