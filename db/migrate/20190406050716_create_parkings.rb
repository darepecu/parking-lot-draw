class CreateParkings < ActiveRecord::Migration[5.2]
  def change
    create_table :parkings do |t|
      t.string :name
      t.string :parking_type

      t.timestamps
    end
  end
end
