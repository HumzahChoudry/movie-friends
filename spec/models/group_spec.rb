require_relative "../rails_helper.rb"

RSpec.describe Group, :type => :model do
  let(:user) {
    User.create(
      :name => "Mindy",
    )
  }


  let(:star_wars) {
    Movie.create(
      :name => "Roller Coaster",
    )
  }

  let(:filmpals) {
    Group.create(
      :name => "Film Pals",
    )
  }

  it "Can not add user to a group he/she is already apart of" do
    filmpals.add_user(user)
    expect(filmpals.users).to include(user)
    expect(filmpals.add_user(user)).to be_falsey
  end

  it 'has name' do
    group = Group.new
    group.name = "SuperGroup"
    group.save
    expect(group.name).to eq("SuperGroup")
  end

  it "fails if it does not have an admin_id" do
    group = Group.new
    group.name = "SuperGroup"
    group.save
    expect(group).not_to be_valid
  end

  it "passes if it does have an admin_id" do
    User.create(name: "Joe")
    group = Group.new
    group.name = "SuperGroup"
    group.admin_id = 1
    group.save
    expect(group).to be_valid
  end

  it "fails if group name is not unique" do
    Group.create(name: "Film CRUUUU")
    expect(Group.create(name: "Film CRUUUU")).not_to be_valid
  end

  it "may have an array of users" do
    filmpals.users << user
    expect(filmpals.users).to include(user)
  end

  it "may have an array of movies" do
    filmpals.movies << star_wars
    expect(filmpals.movies).to include(star_wars)
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
