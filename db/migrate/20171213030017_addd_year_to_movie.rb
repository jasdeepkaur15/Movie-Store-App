class AdddYearToMovie < ActiveRecord::Migration[5.1]
  def change
  	add_column :movies, :year, :integer
  end
end
