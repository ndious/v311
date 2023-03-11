json.scope @code.scope

json.payload do
  json.name @container.name
  json.description @container.description
  json.photo @container.photo
  json.code @code.value
  json.items @container.items do |item|
    json.name item.name
    json.picture item.picture
    json.code item.code.value
    json.qty item.quantity
  end
end
