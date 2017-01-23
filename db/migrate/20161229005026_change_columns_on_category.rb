class ChangeColumnsOnCategory < ActiveRecord::Migration
  def change
    remove_column :categories, :type
    remove_column :categories, :sub_type
    add_column :categories, :name, :string
    add_reference :categories, :category, index: true
  end
end
