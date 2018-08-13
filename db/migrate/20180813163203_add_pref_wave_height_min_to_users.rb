class AddPrefWaveHeightMinToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :pref_wave_height_min, :float
  end
end
