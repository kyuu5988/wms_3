class CreateAirTimes < ActiveRecord::Migration[6.0]
  def change
    create_table :air_times do |t|

      t.timestamps
    end
  end
end
