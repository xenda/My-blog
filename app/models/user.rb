require 'base64'

class User < ActiveRecord::Base
  
  has_many :posts
  has_many :comments
  
  validates_presence_of :email
  validates_presence_of :password
  
  before_save :destroy_plain_password
  
  def destroy_plain_password
    self.password = Base64.encode64(self.password)
  end
  
  def match(user)
    password = Base64.encode64(user.password)
    password == self.password
  end
  
end
