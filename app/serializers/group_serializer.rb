class GroupSerializer < ActiveModel::Serializer
  attributes :id, :name, :website, :twitter_handle, :google_group, :facebook
  has_many :tweets, embed: :ids, key: :tweets
  has_many :posts, embed: :ids, key: :posts
end
