# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::Users::Posts::CommentsController, type: :controller do
  describe 'GET #index' do
    let!(:user) { create(:user) }
    let!(:article) { create(:article, user: user) }
		let!(:comments) { create_list(:comment, 10, user: user, post: article) }
    
    let(:params) do
      {
        user_id: user.id,
				post_id: article.id
      }
    end

    context 'should list all the comments for the user sent in the params' do
      it 'response with success' do
        get(:index, params: params)
        json_response = JSON.parse(response.body)

        expect(response).to have_http_status(:success)
        expect(json_response.count).to eq(10)
        expect(json_response.first['id']).to eq(comments.first.id)
      end
    end
  end

  describe 'POST #create' do
    let!(:user) { create(:user) }
    let!(:article) { create(:article, user: user) }
    # let!(:header) { { 'Authorization' => token_generator(user.id) } }
    
    let(:params) do
      {
        user_id: user.id,
        post_id: article.id,
        comment: {
          content: 'This is a comment'
        }
      }
    end

    # before do
    #   sign_in(user)
    # end

    context 'should list all the comments for the user sent in the params' do
      it 'response with success' do
        request.headers.merge({ 'Authorization' => token_generator(user.id) })
        post(:create, params: params)
        byebug
        json_response = JSON.parse(response.body)
        expect(response).to have_http_status(:success)
        expect(json_response.count).to eq(1)
        expect(json_response['content']).to eq(params[:comment][:content])
      end
    end
  end
end