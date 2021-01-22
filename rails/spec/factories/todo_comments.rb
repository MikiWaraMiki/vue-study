FactoryBot.define do
  factory :todo_comment do
    todo
    memo { 'hogehogheohgoehgoehgoehgoe' }
    created_at { Time.zone.now }
    updated_at { Time.zone.now }
  end
end
