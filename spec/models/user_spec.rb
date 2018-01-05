require_relative "../rails_helper.rb"

RSpec.describe User, :type => :model do
  let(:user) {
    User.create(
      :name => "Mindy",
      :password => "Cool"
    )
  }

  let(:star_wars) {
    Movie.create(
      :name => "Roller Coaster",
    )
  }

  let(:filmpals) {
    Group.create(
      :name => "Ferris Wheel",
      :admin_id => 1
    )
  }

  it "is valid with a name" do
    expect(user).to be_valid
  end

  it "fails if username is not unique" do
    User.create(name: "Mindy")
    expect(User.create(name: "Mindy")).not_to be_valid
  end

  it 'has name' do
    user = User.new
    user.name = "Jamie"
    user.password = "Pass"
    user.save
    expect(user.name).to eq("Jamie")
  end

  it 'has password' do
    user = User.new
    user.name = "Jamie"
    user.password = "Pass"
    user.save
    expect(user.authenticate("Pass")).to be_truthy
  end

  it "may have an array of groups" do
    user.groups << filmpals
    expect(user.groups).to include(filmpals)
  end

  # it "is not valid without a password" do
  #   expect(User.new(name: "Name")).not_to be_valid
  # end
  #
  # it "has a method BLANK that returns BLANK when the user is BLANK" do
  #   expect(user.mood).to eq("sad")
  # end
  #
  # it "has a method BLANK that returns BLANK when the user is BLANK" do
  #   expect(user.mood).to eq("sad")
  # end
  #
  # it "has a method 'mood' that returns 'happy' when the user is more happy than nauseous" do
  #   user.update(:happiness => 7)
  #   expect(user.mood).to eq("happy")
  # end

end
