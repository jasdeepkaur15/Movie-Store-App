class ChangeDatatype < ActiveRecord::Migration[5.1]
  def change
  	change_column :movies, :rating, :int
  end
end
