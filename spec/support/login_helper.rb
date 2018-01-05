module LoginHelper


  def visit_signup
    visit '/'
    # click_link('Sign Up')
  end

  def user_signup
    fill_in("user_name", :with => "Amy Poehler")
    click_button('Sign Up')
  end


  def visit_signin
    visit '/signin'
    # click_link('Sign In')
  end

  def user_login
    fill_in("name", :with => "Truman")
    click_button('Sign In')
  end


end
