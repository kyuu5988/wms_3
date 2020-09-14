class AddModeToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :mode, :string
  end
end
