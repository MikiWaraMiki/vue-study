class CreateTodoComments < ActiveRecord::Migration[6.0]
  def change
    create_table :todo_comments do |t|
      t.references :todo, foreign_key: true, comment: 'todo id'
      t.text :memo, null: false, comment: 'todo memo'
      t.timestamps
    end
  end
end
