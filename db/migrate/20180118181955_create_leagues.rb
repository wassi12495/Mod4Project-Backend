class CreateLeagues < ActiveRecord::Migration[5.1]
  def change
    create_table :leagues do |t|
      t.string :name
      t.integer :api_id
      t.string :league_abr

      t.timestamps
    end
  end
end
