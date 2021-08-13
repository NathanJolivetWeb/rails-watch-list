require 'open-uri'
require 'json'

puts "Cleaning up database..."
Movie.destroy_all
List.destroy_all
puts "Database cleaned"

url = "http://tmdb.lewagon.com/movie/top_rated"
10.times do |i|
  movies = JSON.parse(open("#{url}?page=#{i + 1}").read)['results']
  movies.each do |movie|
    base_poster_url = "https://image.tmdb.org/t/p/original"
    Movie.create(
      title: movie['title'],
      overview: movie['overview'],
      poster_url: "#{base_poster_url}#{movie['backdrop_path']}",
      rating: movie['vote_average']
    )
  end
end
puts "Movies created"

file = URI.open('https://images.unsplash.com/photo-1585647347483-22b66260dfff?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80')
list = List.new(name: 'My Favorite')
list.photo.attach(io: file, filename: 'favorite', content_type: 'image')
list.save

file = URI.open('https://images.unsplash.com/photo-1587270613304-4cc9ef012b92?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=668&q=80')
list = List.new(name: 'Marvel')
list.photo.attach(io: file, filename: 'Marvel', content_type: 'image')
list.save

file = URI.open('https://i.insider.com/5f57835e7ed0ee001e25ddb6?width=1300&format=jpeg&auto=webp')
list = List.new(name: 'New')
list.photo.attach(io: file, filename: 'new', content_type: 'image')
list.save
