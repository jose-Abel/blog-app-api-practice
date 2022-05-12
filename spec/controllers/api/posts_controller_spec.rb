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

    context '' do
      it '' do
        get(:index, params: params)
        byebug
        json_response = JSON.parse(response.body)
        expect(response).to have_http_status(:success)
      end
    end
  end
end