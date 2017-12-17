class RemoveColumnFromMovie < ActiveRecord::Migration[5.1]
  def change
    remove_column :movies, :view_id, :string
  end
end
