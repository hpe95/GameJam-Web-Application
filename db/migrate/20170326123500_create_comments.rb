class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :field
      t.integer :rate

      t.timestamps null: false
    end
  end
end
