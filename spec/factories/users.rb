FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    email 'a@b.com'
    password_digest 'adhd2383t19261s1s'
  end
end