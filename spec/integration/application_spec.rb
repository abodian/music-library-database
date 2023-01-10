require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  context "get /albums" do
    it "should return the list of albums" do
      response = get("/albums")

      expect(response.status).to eq(200)
      expect(response.body).to include("<h1>Albums</h1>")
      expect(response.body).to include("Title: Doolittle")
      expect(response.body).to include("Title: Surfer Rosa")
      expect(response.body).to include('<a href="/albums/1">Link to album information</a>')
      expect(response.body).to include('<a href="/albums/2">Link to album information</a>')
      expect(response.body).to include('<a href="/albums/3">Link to album information</a>')
    end
  end

  context "GET /albums/:id" do
    it 'returns 200 OK and relevant album information' do
      response = get("/albums/1")

      expect(response.status).to eq(200)
      expect(response.body).to include("Artist: Pixies")
      expect(response.body).to include("<h1> Doolittle </h1>")
    end
    
    it 'returns 200 OK and relevant album information' do
      response = get("/albums/2")

      expect(response.status).to eq(200)
      expect(response.body).to include("Artist: Pixies")
      expect(response.body).to include("<h1> Surfer Rosa </h1>")
    end

    it 'returns 200 OK and relevant album information' do
      response = get("/albums/3")

      expect(response.status).to eq(200)
      expect(response.body).to include("Artist: ABBA")
      expect(response.body).to include("<h1> Waterloo </h1>")
    end
  end

  context "GET /artists/:id" do
    it 'returns 200 OK and relevant album information' do
      response = get("/artists/1")

      expect(response.status).to eq(200)
      expect(response.body).to include("Artist: Pixies")
      expect(response.body).to include("Genre: Rock")
    end

    it 'returns 200 OK and relevant album information' do
      response = get("/artists/2")

      expect(response.status).to eq(200)
      expect(response.body).to include("Artist: ABBA")
      expect(response.body).to include("Genre: Pop")
    end
  end

  context "GET /artists" do
    it 'returns 200 OK and list of artists with links for more information' do
      response = get("/artists")

      expect(response.status).to eq(200)
      expect(response.body).to include("Pixies")
      expect(response.body).to include("ABBA")
      expect(response.body).to include("Taylor Swift")
      expect(response.body).to include('<a href="/artists/1">Click here for more information</a>')
      expect(response.body).to include('<a href="/artists/2">Click here for more information</a>')
      expect(response.body).to include('<a href="/artists/3">Click here for more information</a>')
    end
  end

  context "GET /albums/new" do
    it "returns the form page" do
      response = get("albums/new")

      expect(response.status).to eq(200)
      expect(response.body).to include("<h1>Add a new album</h1>")
      expect(response.body).to include('<form method="POST" action="/albums">')
      expect(response.body).to include('<input type="text" name="album_title">')
      expect(response.body).to include('<input type="text" name="album_release_year">')
    end
  end

  context "POST /albums" do
    it "returns a success page" do
      response = post("/albums", album_title: "Album Test 1", album_release_year: "1992", album_artist_id: "2")

      expect(response.status).to eq(200)
      expect(response.body).to include("Album Test 1 has been added")
    end
  end

  context "GET /artists/new" do
    it "returns the form page" do
      response = get("/artists/new")

      expect(response.status).to eq(200)
      expect(response.body).to include("<h1>Add a new artist</h1>")
      expect(response.body).to include('<form method="POST" action="/artists">')
      expect(response.body).to include('<input type="text" name="artist_name">')
      expect(response.body).to include('<input type="text" name="artist_genre">')
    end
  end

  context "POST /artists" do
    it "returns a success page" do
      response = post("/artists", artist_name: "Alex Bodian", artist_genre: "Rock")

      expect(response.status).to eq(200)
      expect(response.body).to include("Alex Bodian has been added")
    end
  end
end
