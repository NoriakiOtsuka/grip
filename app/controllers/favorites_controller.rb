class FavoritesController < ApplicationController
	def create
		@blog = Blog.find(params[:blog_id])
		tourist = @blog.tourist
		guide = @blog.guide
		if tourist_signed_in?
			favorite = current_tourist.favorites.new(blog_id: @blog.id)
		else
			favorite = current_guide.favorites.new(blog_id: @blog.id)
		end
		favorite.save
	end

	def destroy
		@blog = Blog.find(params[:blog_id])
		tourist = @blog.tourist
		guide = @blog.guide
		if tourist_signed_in?
			favorite = current_tourist.favorites.find_by(blog_id: @blog.id)
		else
			favorite = current_guide.favorites.find_by(blog_id: @blog.id)
		end
		favorite.destroy
	end
end
