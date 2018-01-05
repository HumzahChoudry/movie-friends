require_relative "../rails_helper.rb"

RSpec.describe User, :type => :model do
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
