class AddFieldToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :keyword, :string
  end
end
