class AddGameJamToGames < ActiveRecord::Migration
  def change
    add_reference :games, :game_jam, index: true, foreign_key: true
  end
end
