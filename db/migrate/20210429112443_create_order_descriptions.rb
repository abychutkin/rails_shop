class CreateOrderDescriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :order_descriptions do |t|
      t.integer :quantity
      t.references :item, foreign_key: true
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
