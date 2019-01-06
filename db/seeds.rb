# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Foo.create(name: "Foo 1")
Foo.create(name: "Foo 2")
Foo.create(name: "Foo 3")

Foo.first.child_foos << Foo.find(2)
Foo.first.child_foos << Foo.find(3)