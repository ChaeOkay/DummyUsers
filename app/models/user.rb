class User < ActiveRecord::Base
  
  def self.authenticate(username, password)
      self.where(username: username, password: password).empty?
  end
end
