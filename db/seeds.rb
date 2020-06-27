# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create(name: 'Thor, Son of Odin')

Post.create(
  user: user,
  title: 'The Day I Lost My Hammer',
)

heroes_post = Post.create(
  user_id: user.id,
  title: "Because That's What Heroes Do",
)

Sections::Text.create(
  position: 0,
  content: "I'm going to quote myself...",
  post: heroes_post
)

Sections::Quote.create(
  position: 1,
  content: "Because that's what heroes do!",
  post: heroes_post
)

