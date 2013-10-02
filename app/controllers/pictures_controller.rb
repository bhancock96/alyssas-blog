class PicturesController < ApplicationController

	def index
		@client = Instagram.client(:access_token => session[:access_token])
		@pictures = @client.user_recent_media
		@pictures.each do |picture|
			Picture.create(caption: picture.caption.text, source: picture.images.thumbnail.url)
		end
	end

	def connect
		redirect_to Instagram.authorize_url(:redirect_uri => oauth_callback_url)
	end

	def set_token
		response = Instagram.get_access_token(params[:code], :redirect_uri => oauth_callback_url)
		session[:access_token] = response.access_token
		redirect_to pictures_url
	end

	def more_images
		@client = Instagram.client(:access_token => session[:access_token])
		next_twenty = @client.user_recent_media(:max_id => params[:last_picture])
		puts params[:last_picture]	
		puts next_twenty
		respond_to do |format|
			format.json {render json: next_twenty}
			format.js {}
			format.html {render action: 'index'}
		end
	end
end