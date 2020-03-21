class Admin::GuidesController < ApplicationController
	def index
		if params[:region] == "0" #view/applicationでdefault 0 (region: 0) を指定した
			@guides = Guide.all
		else
			@guides = Guide.where(region: guide_search_params[:region])
		end
	end

	def show
		@guide = Guide.find(params[:id])
	end

	def edit
		@guide = Guide.find(params[:id])
	end

	def update
		@guide = Guide.find(params[:id])
		if @guide.update(guide_params)
			redirect_to admin_guides_path, notice: "successfully updated!"
		else
			render "edit"
		end
	end

	private
	def guide_params
		params.require(:guide).permit(:first_name, :last_name, :birthday, :gender, :address, :phone, :email, :profile_image, :introduction, :region, :status)
	end
	def guide_search_params
		params.require(:guide).permit(:region)
	end
end
