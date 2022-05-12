FactoryBot.define do
	factory :post, class: 'Post' do
		content { FFaker::Lorem.word }
		user { association(:user) }
	end
end