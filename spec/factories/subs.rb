# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sub do
    sequence :name do |n|
      "subname #{n}"
    end
    association :moderator, :factory => :user
  end
end
