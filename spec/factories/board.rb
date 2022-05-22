FactoryBot.define do
  factory :board do
    sequence(:title) { |n| "title_#{n}" }
    body { 'sample' }
  end
end
