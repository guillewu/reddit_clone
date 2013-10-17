# Read about factories at https://github.com/thoughtbot/factory_girl



FactoryGirl.define do
  factory :link do
    title "MyString"
    url "MyString"
    text "MyText"

    # http://stackoverflow.com/questions/13851382/factorygirl-has-many-association-with-validation
    after :build do |link, evaluator|
      sub = FactoryGirl.build(:sub)
      link.subs = [sub]
    end
  end
end
