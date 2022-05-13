class Api::Users::PostsController < ApiApplicationController
  include Response

  before_action :set_user, only: [:index]

  def index
    json_response(@user.posts)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
