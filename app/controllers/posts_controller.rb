class PostsController < ApplicationController

	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
	  @post = Post.create(params.require(:post).permit(:title, :description))
	  	binding.pry
	  redirect_to post_path(@post)
	end

	def update
	  @post = Post.find(params[:id])
	  @post.update(params.require(:post).permit(:title, :description))
	  redirect_to post_path(@post)
	end

	def edit
	  @post = Post.find(params[:id])
	end

	private 

	def is_title_case
	    if title.split.any?{|w|w[0].upcase != w[0]}
	      errors.add(:title, "Title must be in title case")
	    end
 	end

end