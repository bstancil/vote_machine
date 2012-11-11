# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Hack.delete_all

Hack.create(title: 'iPhone App',
            hackers: "Bob, Mike",
            gen: false)
Hack.create(title: 'Voter App',
            hackers: "Benn, Stacy",
            gen: true)

Hack.create(title: 'Data Export',
            hackers: "Derek",
            gen: false)
