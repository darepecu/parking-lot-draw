class CreateRaffles < ActiveRecord::Migration[5.2]
  def change
    create_table :raffles do |t|
      t.integer :random_selected
      t.boolean :assigned
      t.references :applicant, foreign_key: true
      t.references :parking, foreign_key: true

      t.timestamps
    end
  end
end
