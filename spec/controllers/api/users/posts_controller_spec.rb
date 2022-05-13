require 'rails_helper'

RSpec.describe Api::Users::PostsController, type: :controller do
  describe 'GET #index' do
    let!(:user) { create(:user) }
    let!(:articles) { create_list(:article, 10, user: user) }

    let(:params) do
      {
        user_id: user.id
      }
    end

    context 'should list all the post for the user sent in the params' do
      it 'response with success' do
        request.headers.merge({ 'Authorization' => token_generator(user.id) })
        get(:index, params: params)
        json_response = JSON.parse(response.body)

        expect(response).to have_http_status(:success)
        expect(json_response.count).to eq(10)
        expect(json_response.first['id']).to eq(articles.first.id)
      end
    end
  end
end
