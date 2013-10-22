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
categories = Category.create([{ name: 'Online Store',description: '' },{ name: 'Customer Service',description: ''},{name: 'Automotive',description: ''},{name: 'Airlines',description: '' },{name: 'Advertisement', description: ''},{name: 'Clothing', description: ''},
  {name: 'Community', description: ''},{name: 'Computer & Internet', description: ''},{name: 'Dining', description: ''},{name: 'Education', description: ''},{name: 'Electronics', description: ''},{name: 'Entertainment', description: ''},{name: 'Finance', description: ''},
{name: 'Health & Fitness', description: ''},{name: 'Home & Garden', description: ''},{name: 'Services', description: ''},{name: 'Sports', description: ''},{name: 'Travel', description: ''},{name: 'Other', description: ''},])
   compnesation= Compensation.create([{ name: 'Apology' },{ name: 'Compensation' },{ name: 'Improvement' },{ name: 'Refund' }])
   
   