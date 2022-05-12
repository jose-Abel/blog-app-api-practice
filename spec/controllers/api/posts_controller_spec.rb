# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::Users::PostsController, type: :controller do
  describe 'GET #index' do
    let!(:user) { create(:user) }
    let!(:posts) { create_list(:post, 10, user: user) }
    
    let(:params) do
      {
        user_id: user.id
      }
    end

    before do

    end

    context 'should list all the post for the user sent in the params' do
      it 'response with success' do
        get(:index, params: params)
        json_response = JSON.parse(response.body)

        expect(response).to have_http_status(:success)
        expect(json_response.count).to eq(10)
        expect(json_response.first['id']).to eq(posts.first.id)
      end
    end
  end
end