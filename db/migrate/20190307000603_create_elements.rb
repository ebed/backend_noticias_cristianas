class CreateElements < ActiveRecord::Migration[5.2]
  def change
    create_table :elements do |t|
      t.references :site_id
      t.string :name
      t.integer :parent_id

      t.timestamps
    end
  end
end
