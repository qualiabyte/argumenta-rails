json.array!(@arguments) do |argument|
  json.extract! argument, :id, :title, :sha1
  json.url argument_url(argument, format: :json)
end
