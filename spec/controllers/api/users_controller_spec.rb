require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  let(:user) { build(:user) }
  let(:headers) { valid_headers.except('Authorization') }
  let(:valid_attributes) do
    attributes_for(:user, password: user.password)
  end

  # User signup test suite
  describe 'POST /signup' do
    context 'when valid request' do
      before { post '/api/signup', params: valid_attributes.to_json, headers: headers }

      it 'creates a new user' do
        expect(response).to have_http_status(201)
      end

      it 'returns success message' do
        json_response = JSON.parse(response.body)
        expect(json_response['message']).to match(/Account created successfully/)
      end

      it 'returns an authentication token' do
        json_response = JSON.parse(response.body)
        expect(json_response['auth_token']).not_to be_nil
      end
    end
  end
end
