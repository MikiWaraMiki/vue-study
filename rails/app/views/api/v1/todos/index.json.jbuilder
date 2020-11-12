json.todos do
  json.array! @todos do |todo|
    json.partial! partial: 'api/v1/schemas/todo', locals: { todo: todo }
  end
end
