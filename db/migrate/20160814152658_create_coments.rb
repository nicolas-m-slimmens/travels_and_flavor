class CreateComents < ActiveRecord::Migration
  def change
    create_table :coments do |t|
      t.text :body
      t.references :article, index: true
      t.references :user, index: true
      t.references :category, index: true

      t.timestamps
    end
  end
end
