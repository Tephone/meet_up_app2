class ChangeContentAddNotnullOnReviews < ActiveRecord::Migration[6.1]
  def change
    change_column :reviews, :content, :text, null: false
  end
end
