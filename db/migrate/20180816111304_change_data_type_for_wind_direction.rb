class ChangeDataTypeForWindDirection < ActiveRecord::Migration[5.2]
  def change
    change_column :forecasts, :wind_direction, :string
    change_column :forecasts, :wave_direction, :string
  end
end
