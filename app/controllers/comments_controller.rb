class CommentsController < ApplicationController
	def new
	end

	def create
		post = Post.find(params[:comment][:post_id])
		comment = post.comments.create(params[:comment])
		if comment.save
			redirect_to post_url(post)
		else
			redirect_to posts_url
		end
	end
end