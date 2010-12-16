class ApplicationController < ActionController::Base
  layout 'application'
  before_filter :mailer_set_url_options

  def mailer_set_url_options
    ActionMailer::Base.default_url_options[:host] = request.host_with_port
  end
  
  # def after_sign_in_path_for(resource_or_scope)
  #   case resource_or_scope
  #   when :user, User
  #     render :json => { :success => true, :user => current_user } 
  #   else
  #     super
  #   end
  # end   
end
