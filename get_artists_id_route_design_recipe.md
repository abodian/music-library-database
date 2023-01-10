# GET /artists/:id Route Design Recipe

_Copy this design recipe template to test-drive a Sinatra route._

## 1. Design the Route Signature

You'll need to include:
  * the HTTP method
  * the path
  * any query parameters (passed in the URL)
  * or body parameters (passed in the request body)

HTTP Method: GET
PATH: /artists/:id
Query Params: :id

## 2. Design the Response

The route might return different responses, depending on the result.

For example, a route for a specific blog post (by its ID) might return `200 OK` if the post exists, but `404 Not Found` if the post is not found in the database.

Your response might return plain text, JSON, or HTML code. 

_Replace the below with your own design. Think of all the different possible responses your route will return._

```html
<html>
  <head></head>
  <body>
    <h1>Artist: <%= artist.name%></h1>
    <p>
      Genre: <%= artist.genre%>
    </p>
  </body>
</html>

<!-- Expected Response: 200 OK
Pixies
Genre: Rock

```

## 3. Write Examples

_Replace these with your own design._


# Request:

GET /artists/1

# Expected response:
```html
<html>
  <head></head>
  <body>
    <h1>Artist: Pixies</h1>
    <p>
      Genre: Rock
    </p>
  </body>
</html>

GET /artists/2

# Expected response:
```html
<html>
  <head></head>
  <body>
    <h1>Artist: ABBA</h1>
    <p>
      Genre: Pop
    </p>
  </body>
</html>

<!-- Expected Response: 200 OK
Artist: Pixies
Genre: Rock

<!-- Expected Response: 200 OK
Artist: ABBA
Genre: Pop
```

## 4. Encode as Tests Examples

```ruby
# EXAMPLE
# file: spec/integration/application_spec.rb

require "spec_helper"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

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
end
```

## 5. Implement the Route

Write the route and web server code to implement the route behaviour.

