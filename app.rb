# file: app.rb
require 'sinatra'
require "sinatra/reloader"
require_relative 'lib/database_connection'
require_relative 'lib/album_repository'
require_relative 'lib/artist_repository'

DatabaseConnection.connect

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/album_repository'
    also_reload 'lib/artist_repository'
  end

  get "/" do
    return erb(:index)
  end

  get "/albums" do
    repo = AlbumRepository.new
    @albums = repo.all

    return erb(:albums)
  end

  get "/albums/new" do
    return erb(:new_album)
  end

  post "/albums" do
    @album = Album.new
    @album.title = params[:album_title]
    @album.release_year = params[:album_release_year]
    @album.artist_id = params[:album_artist_id]

    repo = AlbumRepository.new
    repo.create(@album)

    return erb(:album_created)
  end

  get "/artists" do
    repo = ArtistRepository.new
    @artists = repo.all

    return erb(:artists)
  end

  get "/artists/new" do
    return erb(:new_artist)
  end

  post "/artists" do
    @artist = Artist.new
    @artist.name = params[:artist_name]
    @artist.genre = params[:artist_genre]

    repo = ArtistRepository.new
    repo.create(@artist)

    return erb(:artist_created)
  end

  get "/albums/:id" do
    album_repo = AlbumRepository.new
    artist_repo = ArtistRepository.new
    
    @album = album_repo.find(params[:id])
    @artist = artist_repo.find(@album.artist_id)

    return erb(:album)
  end


  get "/artists/:id" do
    artist_repo = ArtistRepository.new
    @artist = artist_repo.find(params[:id])

    return erb(:artist)
  end
    
end