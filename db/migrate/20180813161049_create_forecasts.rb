class CreateForecasts < ActiveRecord::Migration[5.2]
  def change
    create_table :forecasts do |t|
      t.string :date
      t.references :spot, foreign_key: true
      t.string :time_slot
      t.float :wind_speed
      t.float :wave_heigth
      t.float :wind_direction
      t.float :wave_direction
      t.float :wind_gust
      t.float :wave_period
      t.float :temperature
      t.string :weather_code

      t.timestamps
    end
  end
end
