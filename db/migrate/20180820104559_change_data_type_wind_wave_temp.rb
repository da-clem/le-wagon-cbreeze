class ChangeDataTypeWindWaveTemp < ActiveRecord::Migration[5.2]
  def change
    change_column :forecasts, :wind_speed, :integer
    change_column :forecasts, :wind_gust, :integer
    change_column :forecasts, :wave_period, :integer
    change_column :forecasts, :temperature, :integer
    change_column :users, :pref_wind_speed_max, :integer
    change_column :users, :pref_wind_speed_min, :integer
  end
end
