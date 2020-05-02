# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
creator = Creator.create(name: 'Thor, Son of Odin')

Post.create(
  creator_id: creator.id,
  title: 'God of Thunder',
  content: 'One day my trusty hammer and I...'
)
Post.create(
  creator_id: creator.id,
  title: 'The Day I Lost My Hammer',
  content: 'I was sad the day I lost my hammer...'
)
Post.create(
  creator_id: creator.id,
  title: "Because That's What Heroes Do",
  content: "I don't want to brag, but I'm a bit of a hero..."
)
Post.create(
  creator_id: creator.id,
  title: 'Loki Sucks',
  content: 'I bet you already know this, but Loki sucks...'
)
Post.create(
  creator_id: creator.id,
  title: 'Noobmaster69',
  content: 'You can just call me Noobmaster69 now...'
)
