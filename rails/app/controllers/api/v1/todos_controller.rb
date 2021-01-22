class Api::V1::TodosController < ApplicationController
  before_action :fetch_todo, only: %i(show update destroy)

  # GET /api/v1/todos
  def index
    @todos = Todo.all

    render :index, formats: :json, handlers: :jbuilder, status: :ok
  end

  # GET /api/v1/todos
  def show

    render :show, formats: :json, handlers: :jbuilder, status: :ok
  end

  # POST /api/v1/todos
  def create
    @todo = Todo.new(todo_params)

    if @todo.save
      render :create, formats: :json, handlers: :jbuilder, status: :created
    else
      response_unprocessable_entity(@todo.errors.full_messages)
    end
  end

  # UPDATE /api/v1/todos/:id
  def update
    if @todo.update(todo_params)
      render :update, formats: :json, handlers: :jbuilder, status: :ok
    else
      response_unprocessable_entity(@todo.errors.full_messages)
    end
  end

  # DELETE /api/v1/todos/:id
  def destroy
    if @todo.destroy
      head :no_content
    else
      response_unprocessable_entity(@todo.errors.full_messages)
    end
  end

  private

  def todo_params
    params.require(:todo).permit(
      :name,
      :status,
      :description
    )
  end

  def fetch_todo
    @todo = Todo.find_by(id: params[:id])

    response_not_found if @todo.nil?
  end
end
