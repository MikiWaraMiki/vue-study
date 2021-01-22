json.todoComments do
  json.array! @todo_comments do |todo_comment|
    todo_comment.id todo_comment.id
    todo_comment.todoId todo_comment.todo_id
    todo_comment.memo todo_comment.memo
    todo_comment.createdAt todo_comment.createdAt
  end
end
