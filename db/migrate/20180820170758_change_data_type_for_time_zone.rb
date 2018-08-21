class ChangeDataTypeForTimeZone < ActiveRecord::Migration[5.2]
  def change
    change_column :spots, :timezone, :string

  end
end
