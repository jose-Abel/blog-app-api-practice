class Api::Users::Posts::CommentsController < ApiApplicationController
	include Response

	def index
		@post = Post.find(params[:post_id])
		json_response(@post.comments)
	end

	def create

	end
end