
json.scope @code.scope

json.payload do
    json.name item.name
    json.picture item.picture
    json.code item.code.value
    json.qty item.quantity
end
