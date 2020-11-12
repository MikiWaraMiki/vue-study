class CreateTodos < ActiveRecord::Migration[6.0]
  def change
    create_table :todos do |t|
      t.string :name, null: false, comment: 'todo名'
      t.string :status, null:false, comment: 'todoのステータス'
      t.text :description, null:false, comment: 'todoの詳細'
      t.timestamps
    end
  end
end
