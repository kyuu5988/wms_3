class CreateAirTimes < ActiveRecord::Migration[6.0]
  def change
    create_table :air_times do |t|
      t.integer :sample_id
      t.date :date
      t.time :start_t
      t.time :end_t
      t.time :onair_t
      t.timestamps
    end
  end
end
