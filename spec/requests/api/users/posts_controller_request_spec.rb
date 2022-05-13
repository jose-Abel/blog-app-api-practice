require 'swagger_helper'

RSpec.describe 'api/users/posts', type: :request do
  path '/api/users/{user_id}/posts' do
    get('list posts') do
      produces 'application/json'
      parameter name: 'user_id', in: :path, type: :string, description: 'user_id'
      parameter({
                  in: :header,
                  type: :string,
                  name: :Authorization,
                  required: true,
                  description: 'Client token'
                })

      let(:user) { create(:user) }
      let(:user_id) { user.id }
      let!(:articles) { create_list(:article, 10, user: user) }
      let!(:Authorization) { token_generator(user.id) }

      response(200, 'successful') do
        run_test! do |response|
          json_response = JSON.parse(response.body)

          expect(response).to have_http_status(:success)
          expect(json_response.count).to eq(10)
          expect(json_response.first['id']).to eq(articles.first.id)
        end
      end
    end
  end
end
