class Value
  attr_accessor :id, :href, :metric, :owner, :value, :updated_at
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

  def metric

  end

  def user
    return nil if owner['kind'] != 'user'
    user
  end

  private

  def set_id
    self.id = href.gsub(metric, '')
  end
end
