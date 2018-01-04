module LoginHelper


  def visit_signup
    visit '/users/new'
    # click_link('Sign Up')
  end

  def user_signup
    fill_in("user_name", :with => "Amy Poehler")
    fill_in("user_height", :with => "58")
    fill_in("user_happiness", :with => "3")
    fill_in("user_nausea", :with => "2")
    fill_in("user_tickets", :with => "15")
    fill_in("user_password", :with => "password")
    click_button('Create User')
  end


  def visit_signin
    visit '/signin'
    # click_link('Sign In')
  end

  def user_login
    @mindy = User.create(
      name: "Mindy",
      password: "password",
      happiness: 3,
      nausea: 2,
      tickets: 10,
      height: 50
    )
    fill_in("name", :with => "Mindy")
    fill_in("password", :with => "password")
    click_button('Sign In')
  end


end
