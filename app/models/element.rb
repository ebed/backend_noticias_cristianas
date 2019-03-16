class Element < ApplicationRecord
    has_many :childrens, class_name: 'Element', foreign_key: "parent_id"
end
