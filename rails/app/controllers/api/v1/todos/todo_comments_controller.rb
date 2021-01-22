class Api::V1::Todos::TodoCommentsController < ApplicationController
  before_action :fetch_todo

  # api/v1/todos/:id/todo_comments
  def index
    @todo_comments = TodoComment.where(todo_id: @todo.id)

    render :index, formats: :json, handlers: :jbuilder, status: :ok
  end

  private

  def fetch_todo
    @todo = Todo.find_by(id: params[:id])

    response_not_found if @todo.nil?
  end
end
