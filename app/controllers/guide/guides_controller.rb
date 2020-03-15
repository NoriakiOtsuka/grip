class Guide::GuidesController < ApplicationController
	def index
		@guides = Guide.all
	end

	def show
		@guide = Guide.find(params[:id])
	end

	def create
	end
end