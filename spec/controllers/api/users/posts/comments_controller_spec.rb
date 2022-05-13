require 'rails_helper'

RSpec.describe Api::Users::Posts::CommentsController do
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
        request.headers.merge({ 'Authorization' => token_generator(user.id) })
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
    let!(:another_user) { create(:user) }

    let(:params) do
      {
        user_id: user.id,
        post_id: article.id,
        comment: {
          content: 'This is a comment'
        }
      }
    end

    context 'should create a new comment with the content send in the params' do
      it 'response with success' do
        request.headers.merge({ 'Authorization' => token_generator(another_user.id) })
        post(:create, params: params)

        json_response = JSON.parse(response.body)
        expect(response.status).to eq(201)
        expect(json_response['data']).to eq('Comment was saved successfully!')
        expect(Comment.last.user_id).to eq(another_user.id)
      end
    end
  end
end
