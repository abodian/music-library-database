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

      expected_response = "Doolittle, Surfer Rosa, Waterloo, Super Trouper, Bossanova, Lover, Folklore, I Put a Spell on You, Baltimore, Here Comes the Sun, Fodder on My Wings, Ring Ring"

      expect(response.status).to eq(200)
      expect(response.body).to eq(expected_response)
    end
  end

  context "post /albums" do
    it 'returns 200 OK' do
      response = post('/albums', 
        title: "Voyage", 
        release_year: "2022", 
        artist_id: "2"
      )

      expect(response.status).to eq(200)
      expect(response.body).to eq ""

      response = get('/albums')
      expect(response.body).to include("Voyage")
    end
  end

  context "get /artists" do
    it 'returns 200 OK and list of artists' do
      response = get("/artists")

      expect(response.status).to eq(200)
      expect(response.body).to eq("Pixies, ABBA, Taylor Swift, Nina Simone, Kiasmos")
    end
  end

  context "post /artists" do
    it 'returns 200 OK' do
      response = post("/artists", name: "Wild Nothing", genre: "Indie")

      expect(response.status).to eq(200)

      response = get('/artists')
      expect(response.body).to include("Wild Nothing")
    end
  end

  context "GET /albums/:id" do
    it 'returns 200 OK and relevant album information' do
      response = get("/albums/1")

      expect(response.status).to eq(200)
      expect(response.body).to include("Artist: Pixies")
      expect(response.body).to include("<h1> Doolittle </h1>")
    end
  end
end
