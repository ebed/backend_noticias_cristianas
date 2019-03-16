class AddDateToSite < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :fecha_publicacion, :date
    add_column :elements, :extras, :string
  end
end
