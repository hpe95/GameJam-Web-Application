class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|

			t.string :name
			t.string :site
			t.string :description
			t.string :localization
      t.timestamps null: false
    end
  end
end
