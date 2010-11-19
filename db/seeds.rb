# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
def mailer_set_url_options
  ActionMailer::Base.default_url_options[:host] = request.host_with_port
end 

def create_user (first, last, dept, is_exempt = true)
  user = User.create(:first_name => first, :last_name => last, :login => first.downcase, :password => 'password', :password_confirmation => 'password', :is_exempt => is_exempt, :email => "richcatalano@me.com", :department => dept)
end

def create_manager (first, last, dept)
  mgr = Manager.create(:first_name => first, :last_name => last, :login => first.downcase, :password => 'password', :password_confirmation => 'password', :is_exempt => true, :email => "richcatalano@me.com", :department => dept)
  dept.manager = mgr
end 
 
User.delete_all
dev = Department.create(:name => 'Development')

qa = Department.create(:name => 'QA')

rich = create_user('Rich', 'Catalano', dev)
mark = create_user('Mark', 'Barber', dev)
jon = create_user('Jon', 'Willesen', dev)
dave = create_user('Dave', 'White', dev)
jared = create_user('Jared', 'Pitchford', dev, false)

betsy = create_manager('Betsy', 'Gordon', dev)
brian = create_manager('Brian', 'Artman', qa)