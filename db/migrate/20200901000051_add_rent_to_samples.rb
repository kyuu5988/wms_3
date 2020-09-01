class AddRentToSamples < ActiveRecord::Migration[6.0]
  def change
    add_column :samples, :rent, :string
  end
end
