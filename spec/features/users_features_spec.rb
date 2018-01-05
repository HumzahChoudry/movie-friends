require_relative "../rails_helper.rb"
describe 'Feature Test: User Signup', :type => :feature do

#   it 'successfully signs up' do
#     visit_signup
#     expect(current_path).to eq('/users/new')
#     user_signup
#     expect(current_path).to eq('/users/1')
#     expect(page).to have_content("Amy Poehler")
#
#   end
#
#   it "on sign up, successfully adds a session hash" do
#     visit_signup
#     user_signup
#     expect(page.get_rack_session_key('user_id')).to_not be_nil
#   end
#
#   it 'successfully logs in' do
#     visit_signin
#     expect(current_path).to eq('/signin')
#     user_login
#     expect(current_path).to eq('/users/1')
#     expect(page).to have_content("Mindy")
#   end
#
#   it "on log in, successfully adds a session hash" do
#     visit_signin
#     user_login
#     expect(page.get_rack_session_key('user_id')).to_not be_nil
#   end
#
#   it 'prevents user from viewing user show page and redirects to home page if not logged in' do
#     @mindy = User.create(
#       name: "Mindy",
#     )
#     visit '/users/1'
#     expect(current_path).to eq('/')
#     expect(page).to have_content("Sign Up")
#   end
#
# end
#
# describe 'Feature Test: User Signout', :type => :feature do
#
#   it 'has a link to log out from LOCATION' do
#     visit_signup
#     user_signup
#     expect(page).to have_content("Log Out")
#   end
#
#   it 'redirects to home page after logging out' do
#     visit_signup
#     user_signup
#     click_link("Log Out")
#     expect(current_path).to eq('/')
#   end
#
#   it "successfully destroys session hash when 'Log Out' is clicked" do
#     visit_signup
#     user_signup
#     click_link("Log Out")
#     expect(page.get_rack_session).to_not include("user_id")
#   end
#
#
# end
#
# describe 'Feature Test: Home Page', :type => :feature do
#
#   before :each do
#     @comment1 = Comment.create
#     @comment2 = Comment.create
#     @subcomment = Comment.create
#     visit_signup
#     user_signup
#     # at home screen
#   end
#
#
#   it 'has all comments visible by user without any filters' do
#     expect(page).to have_content("#{@comment1.content}")
#     expect(page).to have_content("#{@comment2.content}")
#     expect(page).to have_content("#{@subcomment.content}")
#   end
#
#   it 'has a link from the user home page to the groups index page' do
#     expect(page).to have_content("Groups")
#     click_link('Groups')
#     expect(current_path).to eq('/groups')
#   end
#
#   it 'has a link from the user home page to the movies index page' do
#     expect(page).to have_content("Movies")
#     click_link('Movies')
#     expect(current_path).to eq('/movies')
#   end
#
#   it 'has a link from the user home page to the user settings page' do
#     expect(page).to have_content("Settings")
#     click_link('Settings')
#     expect(current_path).to eq('/user/:id/edit')
#   end
#
#
# end
#
# describe 'Feature Test: Groups Page', :type => :feature do
#
#   before :each do
#     @group1 = Group.create #user is a member
#     @group2 = Group.create #user is not a member
#     visit_signup
#     user_signup
#     click_link('Groups')
#     # at groups screen
#   end
#
#
#   it 'has all groups' do
#     expect(page).to have_content("#{@group1.content}")
#     expect(page).to have_content("#{@group2.content}")
#   end
#
#   it 'divides groups by user membership' do
#     expect(page).to have_content("#{@group1.content}")
#     expect(page).to have_content("#{@group2.content}")
#     # make a change here to differentiate which div/id or whatever
#   end
#
# end
#
# describe 'Feature Test: Movies Page', :type => :feature do
#
#   before :each do
#     @movie1 = Movie.create #user's group is a discussing
#     @movie2 = Movie.create #user's group is not a discussing
#     visit_signup
#     user_signup
#     click_link('Movies')
#     # at movies screen
#   end
#
#
#   it 'has all movies' do
#     expect(page).to have_content("#{@movie1.content}")
#     expect(page).to have_content("#{@movie2.content}")
#   end
#
#   it 'divides movies by user group membership' do
#     expect(page).to have_content("#{@movie1.content}")
#     expect(page).to have_content("#{@movie2.content}")
#     # make a change here to differentiate which div/id or whatever
#   end
#
# end
#
# describe 'Feature Test: Create Group Page', :type => :feature do
#
#   before :each do
#     visit_signup
#     user_signup
#     click_link('Movies')
#     # at movies screen
#   end
#
#
#   it 'has all movies' do
#     expect(page).to have_content("#{@movie1.content}")
#     expect(page).to have_content("#{@movie2.content}")
#   end
#
#   it 'divides movies by user group membership' do
#     expect(page).to have_content("#{@movie1.content}")
#     expect(page).to have_content("#{@movie2.content}")
#     # make a change here to differentiate which div/id or whatever
#   end

end
