class AddNewToProduct < ActiveRecord::Migration
  def change
    add_column :products, :is_new, :integer, default: 0
  end
end
