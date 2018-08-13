class AddPrefWaveHeightMaxToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :pref_wave_height_max, :float
  end
end
