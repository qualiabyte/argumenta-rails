json.array!(@propositions) do |proposition|
  json.extract! proposition, :id, :text, :sha1
  json.url proposition_url(proposition, format: :json)
end
