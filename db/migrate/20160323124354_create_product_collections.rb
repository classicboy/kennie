class CreateProductCollections < ActiveRecord::Migration
  def change
    create_table :product_collections do |t|
      t.references :product, index: true, foreign_key: true
      t.references :collection, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
