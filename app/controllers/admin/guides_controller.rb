class Admin::GuidesController < ApplicationController
	def index
		@guides = Guide.all
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
end
