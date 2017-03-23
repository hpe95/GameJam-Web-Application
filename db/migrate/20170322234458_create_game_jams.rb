class CreateGameJams < ActiveRecord::Migration
  def change
    create_table :game_jams do |t|

			t.string :theme
			t.date :date
			t.integer :version
			t.string :location
      t.timestamps null: false
    end
  end
end
