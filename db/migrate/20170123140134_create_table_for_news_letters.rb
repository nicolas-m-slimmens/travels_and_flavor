class CreateTableForNewsLetters < ActiveRecord::Migration
  def change

    add_column :articles, :send_news, :boolean

    create_table :subscribers do |t|
      t.string :mail
      t.timestamps
    end
    add_index :subscribers, :mail, unique: true
  end
end
