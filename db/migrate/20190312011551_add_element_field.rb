class AddElementField < ActiveRecord::Migration[5.2]
  def change
    add_column :elements, :new_page, :boolean, :default => false
  end
end
