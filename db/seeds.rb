# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require_relative './media_album_seed.rb'
MediaAlbumInfo::ALBUMS.each do |kind, title, maker, description|
	Medium.create(kind: kind, title: title, maker: maker, description: description )
end

require_relative './media_book_seed.rb'
MediaBookInfo::BOOKS.each do |kind, title, maker, description|
	Medium.create(kind: kind, title: title, maker: maker, description: description )
end

require_relative './media_movie_seed.rb'
MediaMovieInfo::MOVIES.each do |kind, title, maker, description|
	Medium.create(kind: kind, title: title, maker: maker, description: description )
end