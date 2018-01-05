# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Movie.create(name: "Star Wars Episode VIII")
Movie.create(name: "Lord of the Rings: The Two Towers")
Movie.create(name: "Attack the Block")
Movie.create(name: "The Big Sick")
Movie.create(name: "Get Out")
Movie.create(name: "Space Jam")
Movie.create(name: "Hook")
Movie.create(name: "Hitch")
Movie.create(name: "The Last of the Mohicans")
Movie.create(name: "There Will Be Blood")
Movie.create(name: "Moonlight")
Movie.create(name: "The Lobster")
Movie.create(name: "Birdman")
Movie.create(name: "Lady Bird")
Movie.create(name: "Remember the Titans")
Movie.create(name: "House Arrest (it's a 1996 comedy that one day truman wants to make into a psycho thriller)")

User.create(name: "Matt", password: "password")
User.create(name: "Truman", password: "password")
User.create(name: "Humzah", password: "password")

3.times do
  i ||=0
  i += 1
  group = Group.create(name: "House " + Faker::GameOfThrones.unique.house, admin_id: i)
  user = User.find(i)
  group.users << user
end

6.times do
  user = User.create(name: Faker::Twitter.unique.screen_name, password: "password")
  2.times do
    Group.all.select {|group| !group.users.include?(user)}.sample.users << user
  end
end

Group.all.each do |group|
  2.times do
    movie = Movie.all.sample
    if !group.movies.include?(movie)
      group.movies << movie
    end
  end
end



GroupMovie.all.each do |group_movie|
  3.times do
    user = group_movie.group.users.all.sample
    parent_comment = Comment.new(user: user, group_movie: group_movie, content: Faker::BackToTheFuture.unique.quote, vote: 1, parent_id: nil)
    if !parent_comment.valid?
    else
      parent_comment.save
    end
    2.times do
      user = group_movie.group.users.all.sample
      child_comment = Comment.create(user: user, group_movie: group_movie, content: Faker::StarWars.quote + (1..888).to_a.sample.to_s, vote: 1, parent_id: parent_comment.id)
      user = group_movie.group.users.all.sample
      grandchild_comment = Comment.create(user: user, group_movie: group_movie, content: Faker::StarWars.quote + (1..888).to_a.sample.to_s, vote: 1, parent_id: child_comment.id)
    end
  end
end

memento = Movie.create(name: "Memento")
johann = User.create(name: "Johann", password: "password")
j_group = Group.create(name: "I'm by myself", admin_id: johann.id)
Membership.create(user: johann, group: j_group)
j_group_movie = GroupMovie.create(group: j_group, movie: memento)
Comment.create(user: johann, group_movie: j_group_movie, content: "Yo the end of this is crazy")
