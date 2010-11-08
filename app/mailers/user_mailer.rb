class UserMailer < ActionMailer::Base
  default :from => "bngbrgr@gmail.com"
  
  def card_submitted(card)
    @email = card.user.email
    @week_of = card.week_starting
    mail(:to => @email,
        :subject => "TimeCard -  #{@week_of}")
    puts 
  end
end
