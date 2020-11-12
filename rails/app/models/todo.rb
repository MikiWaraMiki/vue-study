# == Schema Information
#
# Table name: todos
#
#  id          :bigint           not null, primary key
#  name        :string(255)      not null
#  status      :string(255)      not null
#  description :text(65535)      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Todo < ApplicationRecord
  extend Enumerize

  enumerize :status, in: %i(not_started_yet in_progress complete)

  validates :name, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 255 }
  validates :status, presence: true
end
