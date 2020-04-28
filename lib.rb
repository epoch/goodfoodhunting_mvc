# helper method
# predicate method
def logged_in? # return a boolean
  # !!session[:user_id]
  if session[:user_id] # -> convert to a boolean 
    true
  else
    false
  end
end

# potential going crash if you use it when you are not logged in
def current_user
  find_one_user_by_id(session[:user_id])
end
