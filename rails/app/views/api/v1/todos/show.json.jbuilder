json.todo do
  json.id @todo.id
  json.name @todo.name
  json.status @todo.status
  json.description @todo.description
  json.createdAt @todo.created_at
  json.updatedAt @todo.updated_at
end
