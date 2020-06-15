class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :item_name
      t.string :main_category
      t.string :sub_category
      t.string :status
      t.text :summary
      t.string :address
      t.integer :price
      t.boolean :active
      t.references :user, foreign_key: true
      
      t.timestamps
    end
  end
end
