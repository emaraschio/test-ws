FactoryGirl.define do
  factory :group_event do
    name { Faker::Lorem.word }
    description { Faker::Lorem.word }
    location { Faker::Lorem.word }
    start_date { Time.zone.now.to_date }
    end_date { (Time.zone.now.to_date + 7) }
    user_id nil
  end
end