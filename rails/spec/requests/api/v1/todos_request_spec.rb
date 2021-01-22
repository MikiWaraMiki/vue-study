require 'rails_helper'

RSpec.describe "Api::V1::Todos", type: :request do
  describe "GET /api/v1/todos" do
    it '200 OKが返却されること' do
      get api_v1_todos_path
      expect(response.status).to eq 200
    end
  end

  describe "POST /api/v1/todos" do
    let!(:todo_params) { attributes_for(:todo) }

    context 'パラメータが正常な場合' do
      it 'レスポンス201を返すこと' do
        post api_v1_todos_path, params: { todo: todo_params }
        expect(response.status).to eq 201
      end
      it 'DBにレコードが登録されていること' do
        expect do
          post api_v1_todos_path, params: { todo: todo_params }
        end.to change(Todo, :count).by(1)
      end
    end

    context '[異常系] パラメータに不足がある場合' do
      before do
        todo_params[:name] = nil
      end
      it 'レスポンス422を返すこと' do
        post api_v1_todos_path, params: { todo: todo_params}
        expect(response.status).to eq 422
      end
    end
  end

  describe "GET /api/v1/todos/{:id}" do
    let!(:todo) { create(:todo) }

    context '存在するtodo' do
      it 'レスポンス200を返す' do
        get api_v1_todo_path(todo.id)
        expect(response.status).to eq 200
      end
    end

    context '存在しないtodo' do
      it 'レスポンス404を返す' do
        get api_v1_todo_path(0)
        expect(response.status).to eq 404
      end
    end
  end

  describe "PUT /api/v1/todos/{:id}" do
    let!(:todo) { create(:todo) }

    context 'パラメータが正常な場合' do
      before do
        todo.status = :complete
      end
      it 'レスポンス200を返すこと' do
        put api_v1_todo_path(todo.id), params: { todo: todo.attributes }
        expect(response.status).to eq 200
      end
      it 'データ更新されていること' do
        put api_v1_todo_path(todo.id), params: { todo: todo.attributes }
        expect(todo.reload.status).to eq :complete
      end
    end

    context '[異常系] idで指定したtodoが存在しない場合' do
      it 'レスポンス404を返すこと' do
        put api_v1_todo_path(0), params: { todo: todo.attributes }
        expect(response.status).to eq 404
      end
    end

    context '[異常系] パラメータが不足している場合' do
      before do
        todo.name = nil
      end
      it 'レスポンス422を返すこと' do
        put api_v1_todo_path(todo.id), params: { todo: todo.attributes }
        expect(response.status).to eq 422
      end
    end
  end

  describe "DELETE /api/v1/todos/{:id}" do
    let!(:todo) { create(:todo) }
    context 'Todoが存在する場合' do
      it 'レスポンス204を返却すること' do
        delete api_v1_todo_path(todo.id)
        expect(response.status).to eq 204
      end
      it 'テーブルからレコードが１件削除されること' do
        expect do
          delete api_v1_todo_path(todo.id)
        end.to change(Todo, :count).by(-1)
      end
    end

    context 'todoが存在しない場合' do
      it 'レスポンス404を返すこと' do
        delete api_v1_todo_path(0)
        expect(response.status).to eq 404
      end
    end
  end
end
