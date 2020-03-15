class Admin::TouristsController < ApplicationController
	def index
		@tourists = Tourist.all
	end

	def show
		@tourist = Tourist.find(params[:id])
	end

	def edit
		@tourist = Tourist.find(params[:id])
	end

	def update
		@tourist = Tourist.find(params[:id])
		if @tourist.update(tourist_params)
			redirect_to admin_tourists_path, notice: "successfully updated!"
		else
			render "edit"
		end
	end

	private
	def tourist_params
		params.require(:tourist).permit(:first_name, :last_name, :birthday, :gender, :nationality, :phone, :email, :profile_image, :introduction, :status)
	end
end
