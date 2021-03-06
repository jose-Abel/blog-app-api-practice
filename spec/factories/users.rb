FactoryBot.define do
  factory :user, class: 'User' do
    name { FFaker::Name.first_name }
    email { FFaker::Internet.email }
    password { FFaker::Internet.password }
  end
end
