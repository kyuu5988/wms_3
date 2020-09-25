class CreateResumes < ActiveRecord::Migration[6.0]
  def change
    create_table :resumes do |t|
      t.integer :user_id
      t.integer :sample_id
      t.string :ロケーション旧
      t.string :ロケーション新
      t.string :name
      t.string :group
      t.timestamps
    end
  end
end
