class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.integer :year
      t.string :engineName
      t.string :url
      t.string :tags
      t.integer :rate

      t.timestamps null: false
    end
  end
end
