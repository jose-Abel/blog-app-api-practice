FactoryBot.define do
	factory :article, class: 'Post' do
		content { FFaker::Lorem.word }
		user { association(:user) }
	end
end