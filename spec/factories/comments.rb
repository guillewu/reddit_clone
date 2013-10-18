# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    text "MyString"

    association :user
    # association :parent_comment, :factory => :comment
    association :link
    # association :child_comments, :factory => :comment
  end
end
