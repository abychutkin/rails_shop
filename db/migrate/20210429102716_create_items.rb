class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.decimal :price, precision: 7, scale: 2

      t.timestamps
    end
  end
end
