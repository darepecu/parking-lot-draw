# frozen_string_literal: true

class CreateParkings < ActiveRecord::Migration[5.2]
  def change
    create_table :parkings do |t|
      t.string :name
      t.string :parking_type
      t.boolean :assigned
      t.timestamps
    end
  end
end
