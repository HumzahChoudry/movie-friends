require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:user) {
    User.create(
      :name => "Mindy",
      :password => "password",
      :nausea => 5,
      :happiness => 3,
      :tickets => 4,
      :height => 34
    )
  }


  let(:star_wars) {
    Movie.create(
      :name => "Roller Coaster",
      :tickets => 5,
      :nausea_rating => 2,
      :happiness_rating => 4,
      :min_height => 32
    )
  }

  let(:filmpals) {
    Group.create(
      :name => "Ferris Wheel",
      :tickets => 2,
      :nausea_rating => 2,
      :happiness_rating => 1,
      :min_height => 28
    )
  }

  it "is valid with a name, password, happiness, nausea, height, and tickets" do
    expect(user).to be_valid
  end

  it "is not valid without a password" do
    expect(User.new(name: "Name")).not_to be_valid
  end

  it "has a method BLANK that returns BLANK when the user is BLANK" do
    expect(user.mood).to eq("sad")
  end

  it "has a method BLANK that returns BLANK when the user is BLANK" do
    expect(user.mood).to eq("sad")
  end

  it "has a method 'mood' that returns 'happy' when the user is more happy than nauseous" do
    user.update(:happiness => 7)
    expect(user.mood).to eq("happy")
  end

end
