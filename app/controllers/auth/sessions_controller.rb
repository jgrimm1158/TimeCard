class Auth::SessionsController < Devise::SessionsController 
  # Have to reimplement :recall => "failure" 
  # for warden to redirect to some action that will return what I want 
  def create
    resource = warden.authenticate!(:scope => resource_name, :recall => "failure")
    sign_in_and_redirect(resource_name, resource) 
  end
  
  # Example of JSON response 
  def sign_in_and_redirect(resource_or_scope, resource=nil) 
    scope      = Devise::Mapping.find_scope!(resource_or_scope) 
    resource ||= resource_or_scope 
    sign_in(scope, resource) unless warden.user(scope) == resource
    render :json => { :success => true} 
  end 
  # JSON login failure message 
  def failure
    render :json => {:success => false, :errors => {:reason => "Login failed. Try again"}} 
  end
  
  def destroy
    sign_out_and_redirect(resource_name)
  end
  
  def sign_out_and_redirect(resource_or_scope)
    scope = Devise::Mapping.find_scope!(resource_or_scope)
    if Devise.sign_out_all_scopes
      sign_out_all_scopes
    else
      sign_out(scope)
    end
    render :json => { :success => true } 
  end
   
end