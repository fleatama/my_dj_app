FactoryBot.define do
  factory :movie do
    content { "MyText" }
    user { nil }
    youtube_url { "MyString" }
  end
end
