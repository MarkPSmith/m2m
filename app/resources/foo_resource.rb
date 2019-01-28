class FooResource < ApplicationResource
  attribute :name, :string
  many_to_many_self_referential :children
  many_to_many_self_referential :parents
end
