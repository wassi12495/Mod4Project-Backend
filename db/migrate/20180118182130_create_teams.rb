class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :api_url
      t.integer :position
      t.string :img
      t.integer :wins
      t.integer :draws
      t.integer :losses
      t.integer :points

      t.timestamps
    end
  end
end
