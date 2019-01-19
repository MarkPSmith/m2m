class FooResource < ApplicationResource
  attribute :name, :string
  many_to_many :children, resource: FooResource, foreign_key: { children: :child_foo_id }, m2m_where_foreign_key: :foo_id do
    assign do |parents, children|
      parents.each do |parent|
        parent.association(:children).loaded!
        children.each do |child|
          parent.children << child
        end
      end
    end
  end
  many_to_many :parents, resource: FooResource, m2m_where_foreign_key: :foo_id
end
