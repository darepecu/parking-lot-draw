# frozen_string_literal: true

class CreateApplicants < ActiveRecord::Migration[5.2]
  def change
    create_table :applicants do |t|
      t.string :plate, nil: false
      t.string :vehicle_type, nil: false

      t.timestamps
    end
  end
end
