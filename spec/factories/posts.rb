FactoryBot.define do
    factory :post do
        association :user
        body { "post text" }
    end
end