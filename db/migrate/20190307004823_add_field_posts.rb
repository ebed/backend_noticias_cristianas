class AddFieldPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :resume, :string
  end
end
