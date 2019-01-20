class FooResource < ApplicationResource
  attribute :name, :string
  many_to_many :children, resource: FooResource, foreign_key: { children: :child_foo_id }, through_primary_key: :foo_id
  many_to_many :parents, resource: FooResource, through_primary_key: :foo_id
end
