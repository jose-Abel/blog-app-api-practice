require 'swagger_helper'

RSpec.describe 'api/users/posts/comments', type: :request do

  path '/api/users/{user_id}/posts/{post_id}/comments' do
    get('all comment') do
      produces 'application/json'
      parameter name: 'user_id', in: :path, type: :string, description: 'user_id'
			parameter name: 'post_id', in: :path, type: :string, description: 'post_id'
			parameter name: :params, in: :body, schema: {
				type: :object,
				properties: {
					comment: { content: { type: :string } }
				}
			}

      parameter({
        :in => :header,
        :type => :string,
        :name => :Authorization,
        :required => true,
        :description => 'Client token'
      })

			let(:user) { create(:user) }
			let!(:another_user) { create(:user) }
      let!(:Authorization) { token_generator(another_user.id) }
			let(:user_id) { user.id }
			let!(:article) { create(:article, user: user) }
      let(:post_id) { article.id }
			let!(:comments) { create_list(:comment, 10, user: user, post: article) }

      response(200, 'successful') do
        run_test! do |response|
					json_response = JSON.parse(response.body)

					expect(response).to have_http_status(:success)
					expect(json_response.count).to eq(10)
					expect(json_response.first['id']).to eq(comments.first.id)
        end
      end
    end

    post('comment') do
      consumes "application/json"
      produces 'application/json'
      parameter name: 'user_id', in: :path, type: :string, description: 'user_id'
			parameter name: 'post_id', in: :path, type: :string, description: 'post_id'
			parameter name: :params, in: :body, schema: {
				type: :object,
				properties: {
					comment: { content: { type: :string } }
				}
			}

      parameter({
        :in => :header,
        :type => :string,
        :name => :Authorization,
        :required => true,
        :description => 'Client token'
      })

			let(:user) { create(:user) }
			let!(:another_user) { create(:user) }
      let!(:Authorization) { token_generator(another_user.id) }
			let(:user_id) { user.id }
			let!(:article) { create(:article, user: user) }
      let(:post_id) { article.id }

			let(:params) do 
				{
					comment: {
						content: 'This is a comment'
					}
				}
			end

      response(201, 'successful') do
        run_test! do |response|
					json_response = JSON.parse(response.body)

					expect(response.status).to eq(201)
					expect(json_response['data']).to eq('Comment was saved successfully!')
					expect(Comment.last.user_id).to eq(another_user.id)
        end
      end
    end
  end
end