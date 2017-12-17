class CreateViewTables < ActiveRecord::Migration[5.1]
  def change
    create_table :view_tables do |t|
      t.references :movie, foreign_key: true
      t.integer :counter

      t.timestamps
    end
  end
end
