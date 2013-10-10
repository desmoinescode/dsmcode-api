class AddGroupIdToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :group_id, :integer
  end
end
