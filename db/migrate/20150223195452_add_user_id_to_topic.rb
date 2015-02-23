class AddUserIdToTopic < ActiveRecord::Migration
  def change
  	add_column :topics, :user_id, :string
  end
end
