class AddAssignedToApplicant < ActiveRecord::Migration[5.2]
  def change
    add_column :applicants, :assigned, :boolean
  end
end
