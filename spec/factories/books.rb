=begin
FactoryBot.define do
  factory :book do
    title { "MyString" }
    published_at { "2022-07-14" }
    author { nil }
  end
end
=end

FactoryBot.define do
  factory :book do
    title { 'The Silent Hill' }
  end
end