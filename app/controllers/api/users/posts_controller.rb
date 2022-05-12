class Api::Users::PostsController < ApiApplicationController
	include Response

	def index
		@user = User.find(params[:user_id])
		json_response(@user.posts)
	end
end