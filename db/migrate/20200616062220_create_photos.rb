class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.references :item
      t.string :image
      t.timestamps
    end
  end
end
