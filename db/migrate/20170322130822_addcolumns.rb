class Addcolumns < ActiveRecord::Migration
  def change
    add_column :users, :type, :string

  	add_column :users, :name, :string
    add_column :users, :moderator, :boolean

    add_column :users, :github, :string
    add_column :users, :company, :string
  end
end
