class Post < ApplicationRecord
    is_sluggable :title, :slug_column=>:slug, :history => false, :to_param=>true, :editable => false
end
