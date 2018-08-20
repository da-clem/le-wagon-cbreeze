class AddTimezoneToSpots < ActiveRecord::Migration[5.2]
  def change
    add_column :spots, :timezone, :integer
  end
end
