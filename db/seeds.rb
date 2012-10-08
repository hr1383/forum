# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  Scenarios.delete_all
   Category.delete_all
   Compensation.delete_all
   
   scenarios = Scenarios.create([{ name: 'Billing' }, { name: 'Delay' },{ name: 'Damage' },{ name: 'Discrimination' },{ name: 'Poor Service' }])
   categories = Category.create([{ name: 'Online Store' },{ name: 'Customer Service' }])
   compnesation= Compensation.create([{ name: 'Apology' },{ name: 'Compnesation' },{ name: 'Improvement' },{ name: 'Refund' }])
   
   