class Droptable < ActiveRecord::Migration
  def change
  	remove_reference :comments, :user, foreign_key: true
  	drop_table :users
  end
end
