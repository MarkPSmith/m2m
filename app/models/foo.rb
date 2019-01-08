class Foo < ApplicationRecord
  has_many :child_relationships, class_name: 'FooFoo', foreign_key: :foo_id
  has_many :parent_relationships, class_name: 'FooFoo', foreign_key: :child_foo_id
  has_many :children, through: :child_relationships, source: 'child'
  has_many :parents, through: :parent_relationships, source: 'parent'
end
