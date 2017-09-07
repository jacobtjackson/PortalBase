FactoryGirl.define do
  factory :user do
    id 1
    email 'test1@portalbase.io'
    password 'password'
    password_confirmation 'password'
  end
end
