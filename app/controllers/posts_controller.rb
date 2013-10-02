class PostsController < ApplicationController
	def index
		@posts = Post.order("created_at DESC")
	end

	def new
		@post = Post.new
		@pictures = Picture.all
	end

	def create
		admin = current_admin
		post = admin.posts.create(params[:post])
		if post.save
			redirect_to posts_url
		else
			redirect_to new_post_url
		end
	end

	def show
		@post = Post.find(params[:id])
		@comment = Comment.new
	end
end