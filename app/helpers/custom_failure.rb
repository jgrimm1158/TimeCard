class CustomFailure < Devise::FailureApp
  def redirect_url
    failed_login_url
  end
  
  # You need to override respond to eliminate recall
  def respond
    redirect
  end  
end