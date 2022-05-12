FactoryBot.define do
    factory :post, class: 'Post' do
        content { FFaker::Lorem.word }
        user { association(:user) }
        # like { association(:like) }
    end
end