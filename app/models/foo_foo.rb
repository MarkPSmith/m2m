class FooFoo < ApplicationRecord
  belongs_to :parent, class_name: 'Foo', foreign_key: :foo_id
  belongs_to :child, class_name: "Foo", foreign_key: :child_foo_id
end
