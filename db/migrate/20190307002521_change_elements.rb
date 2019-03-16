class ChangeElements < ActiveRecord::Migration[5.2]
  def change
    add_column :elements, :site_id, :integer 
    remove_column :elements, :site_id_id
  end
end
