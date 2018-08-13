class AddPrefWindSpeedMaxToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :pref_wind_speed_max, :float
  end
end
