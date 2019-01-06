class CreateFooFoos < ActiveRecord::Migration[5.2]
  def change
    create_table :foo_foos do |t|
      t.belongs_to :foo
      t.belongs_to :child_foo

      t.timestamps
    end
  end
end
