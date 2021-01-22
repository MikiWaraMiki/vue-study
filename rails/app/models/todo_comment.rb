# == Schema Information
#
# Table name: todo_comments
#
#  id         :bigint           not null, primary key
#  todo_id    :bigint
#  memo       :text(65535)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class TodoComment < ApplicationRecord

  belongs_to :todo

  validates :memo, presence: :true, length: { maximum: 2000 }
end
