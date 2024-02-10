json.scope 'create'

json.payload do
  json.id @code.id
  json.value @code.value
  json.scope @code.scope
end
