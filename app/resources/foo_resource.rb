class FooResource < ApplicationResource
  attribute :name, :string
  many_to_many :child_foos, resource: FooResource
end
