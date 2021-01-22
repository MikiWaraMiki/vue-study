# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'factory_bot_rails'
# Todo 10件作成
10.times do |count_index|
  todo = FactoryBot.build(:todo, name: "test todo #{count_index}", status: Todo.status.values.sample.to_sym)
  todo.save!
end

# Todoコメントをそれぞれ10件登録
todos = Todo.all

todos.each do |todo|
  10.times do |count_index|
    todo_comment = FactoryBot.build(:todo_comment, todo: todo)
    todo_comment.save!
  end
end
