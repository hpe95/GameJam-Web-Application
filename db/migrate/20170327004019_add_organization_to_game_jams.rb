class AddOrganizationToGameJams < ActiveRecord::Migration
  def change
    add_reference :game_jams, :organization, index: true, foreign_key: true
  end
end
