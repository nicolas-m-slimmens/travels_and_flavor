class AddNewColumnsToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :description, :text
    add_column :articles, :published, :boolean
    add_column :articles, :image, :string
    add_column :articles, :tags, :text
  end
end
