require 'rails_helper'

RSpec.describe Todo, type: :model do
  describe "validate" do
    let!(:todo) { build(:todo) }
    context '[異常系] nameが入力されていない場合' do
      it 'バリデーションエラーが発生すること' do
        todo.name = nil
        expect(todo.valid?).to be_falsey
      end
    end
    context '[異常系] statusが入力されていない場合' do
      it 'バリデーションエラーが発生すること' do
        todo.status = nil
        expect(todo.valid?).to be_falsey
      end
    end
    context '[異常系] descriptionが入力されていない場合' do
      it 'エラーが発生すること' do
        todo.description = nil
        expect(todo.valid?).to be_falsey
      end
    end
    context '[異常系] statusがenumで定義された値以外の場合' do
      it 'エラーが発生すること' do
        todo.status = :hoge
        expect(todo.valid?).to be_falsey
      end
    end
    context '[異常系] nameが51文字以上の場合' do
      it 'エラーが発生すること' do
        todo.name = "a" * 51
        expect(todo.valid?).to be_falsey
      end
    end
    context '[異常系] descriptionが256文字以上の場合' do
      it 'エラーが発生すること' do
        todo.description = "a" * 256
        expect(todo.valid?).to be_falsey
      end
    end
  end
end
