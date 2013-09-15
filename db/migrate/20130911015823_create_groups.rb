class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.string :website
      t.string :twitter_handle
      t.string :google_group
      t.string :facebook

      t.timestamps
    end
  end
end
