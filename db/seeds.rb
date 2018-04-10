# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Cleaning database...'
Article.destroy_all
Page.destroy_all

puts 'Creating articles...'
articles_attributes = [
  {
    title: "Good to great UI animation tips",
    author: "Pablo Stanley",
    date: "06/03/2018",
    headlines: "Practical suggestions to improve your UI micro-interactions.",
    url: "https://uxdesign.cc/good-to-great-ui-animation-tips-7850805c12e5?ref=uxdesignweekly"

  },
  {
  title: "How to become a designer without going to design school",
  author: "Karen X. Cheng",
  date: "19/06/2013",
  headlines: "This is a guide to teach yourself design.",
  url: "http://www.karenx.com/blog/how-to-become-a-designer-without-going-to-design-school/"
  },
  {
    title: "How to become a designer without going to design school",
    author: "Issara Willenskomer",
    date: "Mar 31, 2017",
    headlines: "Creating Usability with Motion: The UX in Motion Manifesto",
    url: "https://medium.com/ux-in-motion/creating-usability-with-motion-the-ux-in-motion-manifesto-a87a4584ddc"
  },
  {
    title: "7 steps to become a UI/UX designer",
    author: "Nicole Saidy",
    date: "May 25, 2017",
    headlines: "Tips & resources to help you get started",
    url: "https://blog.nicolesaidy.com/7-steps-to-become-a-ui-ux-designer-8beed7639a95"
  }

]
Article.create!(articles_attributes)

puts 'Creating pages...'
pages_attributes = [
  {
    title: "La Binchoise",
    author: "diplostudio",
    date: "06/03/2018",
    headlines: "Nice product presentation and valorisation.",
    url: "http://www.brasserielabinchoise.be/"

  },
  {
  title: "LOUD srl",
  author: "LOUD srl",
  date: "19/06/2013",
  headlines: "This is a guide to teach yourself design.",
  url: "https://loudsrl.com/"
  },
  {
    title: "Furniture shop",
    author: "L.lei for NBSP",
    date: "Mar 31, 2017",
    headlines: "Creating Usability with Motion: The UX in Motion Manifesto",
    url: "https://dribbble.com/shots/4419346-funiture-shopping-gif"
  },

]
Page.create!(pages_attributes)
puts 'Finished!'
