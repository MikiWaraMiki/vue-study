json.todoComments do
  json.array! @todo_comments do |todo_comment|
    json.id todo_comment.id
    json.todoId todo_comment.todo_id
    json.memo todo_comment.memo
    json.createdAt todo_comment.created_at
  end
end
