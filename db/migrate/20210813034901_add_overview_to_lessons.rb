class AddOverviewToLessons < ActiveRecord::Migration[6.1]
  def change
    add_column :lessons, :overview, :text
  end
end
