json.todo do
  json.partial! partial: 'api/v1/schemas/todo', locals: { todo: @todo }
end
