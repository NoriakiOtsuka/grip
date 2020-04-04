class Guide::GuidesController < ApplicationController
	def index
		if params[:region] == "0" || "" #view/applicationでdefault 0 (region: 0) を指定した
			@guides = Guide.all
		else
			@guides = Guide.where(region: guide_search_params[:region])
		end
	end

	def show
		@guide = Guide.find(params[:id])
	end

	def create
	end

	private
	def guide_search_params
		params.require(:guide).permit(:region)
	end
end