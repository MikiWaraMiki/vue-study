require 'rails_helper'

RSpec.describe "Api::V1::Todos::TodoComments", type: :request do
  describe 'GET /api/v1/todos/:id/todo_comments' do
    let(:todo) { create(:todo) }
    let(:comment) { create(:todo_comment) }

    context '存在するtodoを指定している' do
      it 'レスポンス200を返す' do
        get api_v1_todos_todo_comments_path(todo.id)
        expect(response).to have_http_status 200
      end
    end

    context '存在しないtodoを指定している' do
      it 'レスポンス200を返す' do
        get api_v1_todos_todo_comments_path(0)
        expect(response).to have_http_status 404
      end
    end
  end
end
