# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Movie.create(name: "Star Wars Episode VIII", image_url: "example")
Movie.create(name: "Lord of the Rings: The Two Towers", image_url: "example")
Movie.create(name: "Attack the Block", image_url: "example")
Movie.create(name: "The Big Sick", image_url: "example")
Movie.create(name: "Get Out", image_url: "example")

User.create(name: "Matt")
User.create(name: "Truman")
User.create(name: "Humzah")

3.times do
  i ||=0
  i += 1
  group = Group.create(name: "House " + Faker::GameOfThrones.unique.house, admin_id: i)
  group.users << User.find(i)
end

10.times do
  user = User.create(name: Faker::Twitter.unique.screen_name)
  3.times do
    Group.all.sample.users << user
  end
end

Group.all.each do |group|
  3.times do
    group.movies << Movie.all.sample
  end
end



GroupMovie.all.each do |group_movie|
  5.times do
    user = group_movie.group.users.all.sample
    parent_comment = Comment.new(user: user, group_movie: group_movie, content: Faker::BackToTheFuture.unique.quote, vote: 1, parent_id: nil)
    if !parent_comment.valid?
      byebug
    else
      parent_comment.save
    end
    3.times do
      user = group_movie.group.users.all.sample
      child_comment = Comment.create(user: user, group_movie: group_movie, content: Faker::StarWars.unique.quote, vote: 1, parent_id: parent_comment.id)
      user = group_movie.group.users.all.sample
      grandchild_comment = Comment.create(user: user, group_movie: group_movie, content: Faker::RickAndMorty.unique.quote, vote: 1, parent_id: child_comment.id)
    end
  end
end
