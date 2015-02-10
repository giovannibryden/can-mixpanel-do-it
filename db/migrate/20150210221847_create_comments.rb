class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :name
      t.string :email
      t.text :body
      t.references :topics, index: true

      t.timestamps null: false
    end
    add_foreign_key :comments, :topics
  end
end
