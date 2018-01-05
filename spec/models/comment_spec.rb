RSpec.describe Comment, :type => :model do
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

  it "must have a user AND a group_movie_id" do
    joe = User.create(name: "Joe")

    group_movie = GroupMovie.create(group_id: filmpals.id, movie_id: star_wars.id )

    comment = Comment.new(user_id: joe.id, group_movie_id: group_movie.id )

    expect(comment.save).to be_falsey
  end

end
