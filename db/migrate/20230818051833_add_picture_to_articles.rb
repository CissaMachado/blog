class AddPictureToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :picture, :string
  end
end
