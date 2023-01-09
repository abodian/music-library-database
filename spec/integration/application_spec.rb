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
end
