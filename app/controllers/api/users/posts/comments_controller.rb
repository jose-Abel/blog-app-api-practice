class Api::Users::Posts::CommentsController < ApiApplicationController
	include Response
	include ExceptionHandler

	def index
		@post = Post.find(params[:post_id])
		json_response(@post.comments)
	end

	def create
		byebug
	end
end