# Parse a http response as JSON
def response_body
  JSON.parse(response.body, symbolize_names: true)
end
