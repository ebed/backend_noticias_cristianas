class ChangeElementsTitles < ActiveRecord::Migration[5.2]
  def change
    add_column :elements, :type_element, :string
  end
end
