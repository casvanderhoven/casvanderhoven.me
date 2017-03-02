FactoryGirl.define do
  factory :project do
    name "MyString"
    description "MyText"
    link "MyString"
  end
  factory :article do
    title "MyString"
    content "MyText"
    category "MyString"
  end
end
