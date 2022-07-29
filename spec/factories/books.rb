FactoryBot.define do
  factory :book do
    title { "MyString" }
    published_at { "2022-07-14" }
    author { nil }
    #author { FactoryBot.create(:author) }
  end
end
