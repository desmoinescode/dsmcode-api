class Group < ActiveRecord::Base
  has_many :tweets
  has_many :posts
end
