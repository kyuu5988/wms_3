class AddSortToAirTimes < ActiveRecord::Migration[6.0]
  def change
    add_column :air_times, :sort_t, :integer
  end
end
