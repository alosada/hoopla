class User
  attr_accessor :id, :href, :first_name, :last_name, :email, :confirmed_email, :updated_at, :birthday, :anniversary
  include Hooplable
  
  class << self
    def all
      all_raw.map {|data| new(data)}
    end

    def find(id)
      new(hoopla_client.get("users/#{id}", method: 'get'))
    end
  
    private
  
    def all_raw
      hoopla_client.get('users', method: 'get')
    end

  end

  private

  def set_id
    self.id = href.gsub('https://api.hoopla.net/users/', '')
  end
end
