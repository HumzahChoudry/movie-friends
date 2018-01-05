RSpec.describe Movie, :type => :model do
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

  it "has a name" do
    movie = Movie.new
    movie.name = "Dumb and Dumber"
    movie.save
    expect(movie.name).to eq("Dumb and Dumber")
  end

  it "name does not have to be unique" do
    Movie.create(name: "Dumb and Dumber")
    expect(Movie.create(name: "Dumb and Dumber")).to be_valid
  end

end
