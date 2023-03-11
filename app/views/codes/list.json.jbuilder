json.scope "search"

json.payload @codes do |code|
  json.id code.id
  json.value code.value
  json.scope code.scope
end
