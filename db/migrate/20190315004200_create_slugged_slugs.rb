class CreateSluggedSlugs < ActiveRecord::Migration[4.2]
  
  def self.up
    create_table :slugs do |t|
      t.string   :scope
      t.string   :slug
      t.integer  :record_id
      t.datetime :created_at
    end

    add_column :posts, :cached_slug, :string
    add_index :posts,  :cached_slug
    add_index :slugs, [:scope, :slug]
    add_index :slugs, [:scope, :record_id]
    add_index :slugs, [:scope, :slug, :created_at]
    add_index :slugs, [:scope, :record_id, :created_at]
  end

  def self.down
    drop_table :slugs
  end
  
end
