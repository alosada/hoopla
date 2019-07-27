module Hooplable
  extend ActiveSupport::Concern
  module ClassMethods

    private
    
    def hoopla_client
      @hoopla_client ||= HooplaClient.hoopla_client
    end
  end

  def initialize(data)
    return self if data.nil?
    @data = data
    data.each_pair do |k,v|
      self.try("#{k}=", v)
    end
    set_id
  end

  private

  def set_id
    raise NotImplementedError
  end

  def hoopla_client
    @hoopla_client ||= HooplaClient.hoopla_client
  end
end