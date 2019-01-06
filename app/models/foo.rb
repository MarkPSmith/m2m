class Foo < ApplicationRecord
  has_many :foo_foos
  has_many :child_foos, through: :foo_foos
end
