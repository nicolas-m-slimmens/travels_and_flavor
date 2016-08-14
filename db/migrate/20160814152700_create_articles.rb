class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.timestamp :available_from
      t.references :user, index: true
      t.references :category, index: true

      t.timestamps
    end
  end
end
