FactoryBot.define do
	factory :comment, class: 'Comment' do
		content { FFaker::Lorem.word }
		user { association(:user) }
		post { association(:article) }
	end
end