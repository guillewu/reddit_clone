# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "MyString #{n}"
    end
    password_digest "MyString"
    password "Password"
    sequence :session_token do |n|
      "MyString #{n}"
    end

  end
end
