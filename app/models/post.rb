class Post < ActiveRecord::Base
  
  validates_presence_of :title
  validates_presence_of :user_id
  validates_numericality_of :user_id
  
  has_many :comments
  
  
end
