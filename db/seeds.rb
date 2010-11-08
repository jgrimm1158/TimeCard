# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
User.delete_all
betsy = User.create(:first_name => 'Betsy', :last_name => 'Gordon', :login => 'betsy', :password => 'pw', :exempt => true, :manager => true)

Department.delete_all
dev = Department.create(:name => 'Development', :manager => betsy)
betsy.deparment = dev
betsy.save

rich = User.create(:first_name => 'Rich', :last_name => 'Catalano', :login => 'rich', :password => 'pw', :exempt => true, :manager => true)


