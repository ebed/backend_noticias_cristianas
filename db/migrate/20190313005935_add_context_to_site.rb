class AddContextToSite < ActiveRecord::Migration[5.2]
  def change
    add_column :sites, :contexto, :string
  end
end
