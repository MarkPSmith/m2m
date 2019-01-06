class FooFoo < ApplicationRecord
  belongs_to :foo
  belongs_to :child_foo, class_name: "Foo"
end
