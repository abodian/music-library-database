# GET /albums/:id Route Design Recipe

_Copy this design recipe template to test-drive a Sinatra route._

## 1. Design the Route Signature

You'll need to include:
  * the HTTP method
  * the path
  * any query parameters (passed in the URL)
  * or body parameters (passed in the request body)

HTTP Method: GET
PATH: /albums/:id
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
    <h1>Doolittle</h1>
    <p>
      Release Year: 1989
      Artist: Pixies
    </p>
  </body>
</html>

<!-- Expected Response: 200 OK
Doolittle
Release Year: 1989
Artist: Pixies

```

## 3. Write Examples

_Replace these with your own design._


# Request:

GET /albums/1

# Expected response:
```html
<html>
  <head></head>
  <body>
    <h1>Doolittle</h1>
    <p>
      Release Year: 1989
      Artist: Pixies
    </p>
  </body>
</html>

<!-- Expected Response: 200 OK
Doolittle
Release Year: 1989
Artist: Pixies
```

## 4. Encode as Tests Examples

```ruby
# EXAMPLE
# file: spec/integration/application_spec.rb

require "spec_helper"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "GET /albums/:id" do
    it 'returns 200 OK and relevant album information' do
      response = get("/albums/1")

      expect(response.status).to eq(200)
      expect(response.body).to include("Pixies")
      expect(response.body).to include("Doolittle")
    end
  end
end
```

## 5. Implement the Route

Write the route and web server code to implement the route behaviour.

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications&prefill_File=resources%2Fsinatra_route_design_recipe_template.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications&prefill_File=resources%2Fsinatra_route_design_recipe_template.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications&prefill_File=resources%2Fsinatra_route_design_recipe_template.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications&prefill_File=resources%2Fsinatra_route_design_recipe_template.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications&prefill_File=resources%2Fsinatra_route_design_recipe_template.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->