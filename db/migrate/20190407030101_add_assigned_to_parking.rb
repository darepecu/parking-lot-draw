class AddAssignedToParking < ActiveRecord::Migration[5.2]
  def change
    add_column :parkings, :assigned, :boolean
  end
end