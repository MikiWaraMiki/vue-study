FactoryBot.define do
  factory :todo do
    name { "hoge" }
    status { :not_started_yet }
    description { "hoge description" }
    created_at { Time.zone.now }
    updated_at { Time.zone.now }
  end
end
