# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#array list of fixed attractions
attractions = [
  { name:'Sentosa',
    address:'Sentosa',
    category:'Family',
    description:'Premier island resort getaway',
    image_url:'http://travel-elite.ru/uploads/posts/2010-08/1282215821_sentosa_island_05.jpg' },
  { name:'Singapore Flyer',
    address:'Singapore Flyer',
    category:'Sightseeing',
    description:'Giant ferris wheel',
    image_url:'http://thaholiday.com/wp-content/uploads/2016/03/Singapore-Flyer.jpg'},
  { name:'Universal Studios Singapore',
    address:'Universal Studios Singapore',
    category:'Amusement Park',
    description:'Amusement park',
    image_url:'https://store.sentosa.com.sg/static/prod/BSG__581x298.jpg'},
  { name:'Night Safari',
    address:'Night Safari Singapore',
    category:'Family/Outdoor',
    description:'Nocturnal Zoo',
    image_url:'http://www.livelimitless.net/wp-content/uploads/2012/11/Entrance.jpg'
  }
]
(0..attractions.count-1).each { |x|
  Attraction.create(attractions[x]);
}
