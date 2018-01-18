class CreateFixtures < ActiveRecord::Migration[5.1]
  def change
    create_table :fixtures do |t|
      t.string :home
      t.string :away
      t.integer :home_score
      t.integer :away_score
      t.string :date
      t.string :status

      t.timestamps
    end
  end
end
