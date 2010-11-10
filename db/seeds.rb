# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

def create_user (first, last, dept, exempt = true)
  user = User.create(:first_name => first, :last_name => last, :login => first.downcase, :password => 'pass', :password_confirmation => 'pass', :exempt => exempt, :email => "#{first}@twoamsoftware.com", :department => dept)
  user
end 

Department.delete_all

dev = Department.create(:name => 'Development')

qa = Department.create(:name => 'QA')

User.delete_all

rich = create_user('Rich', 'Catalano', dev)
mark = create_user('Mark', 'Barber', dev)
jon = create_user('Jon', 'Willesen', dev)
dave = create_user('Dave', 'White', dev)
jared = create_user('Jared', 'Pitchford', dev, false)
betsy = create_user('Betsy', 'Gordon', dev)
betsy.isManager = true
dev.manager = betsy
betsy.save

brian = create_user('Brian', 'Artman', qa)
brian.isManager = true
qa.manager = brian
brian.save