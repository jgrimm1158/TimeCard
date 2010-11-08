# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
User.delete_all

def create_user (first, last, dept, exempt = true)
  user = User.create(:first_name => first, :last_name => last, :login => first.downcase, :password => 'pass', :password_confirmation => 'pass', :exempt => exempt, :email => "#{first}@twoamsoftware.com", :department => dept)
  puts user.errors
  user
end 
 
betsy = User.create(:first_name => 'Betsy', :last_name => 'Gordon', :login => 'betsy', :password => 'pass', :exempt => true, :email => 'betsy@twoamsoftware.com', :isManager => true)
brian = User.create(:first_name => 'Brian', :last_name => 'Artman', :login => 'brian', :password => 'pass', :exempt => true, :email => 'brian@twoamsoftware.com', :isManager => true)

Department.delete_all
dev = Department.create(:name => 'Development', :manager => betsy)
betsy.department = dev
betsy.save

qa = Department.create(:name => 'QA', :manager => brian)
brian.department = qa
brian.save


rich = create_user('Rich', 'Catalano', dev)
mark = create_user('Mark', 'Barber', dev)
jon = create_user('Jon', 'Willesen', dev)
dave = create_user('Dave', 'White', dev)
jared = create_user('Jared', 'Pitchford', dev, false)
