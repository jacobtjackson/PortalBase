FactoryGirl.define do
  factory :identity do
    user nil
    provider "MyString"
    uid "MyString"
  end

  factory :google_identity, class: Identity do
    user
    provider "google_oauth2"
    uid 12345
  end
end
