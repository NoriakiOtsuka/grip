class TouristsController < ApplicationController
	def top
		@guides = Guide.all
	end

	def show
		@tourist = Tourist.find(params[:id])
		if @tourist.id != current_tourist.id
			redirect_to tourist_path(current_tourist.id)
		end
	end

	def edit
		@tourist = Tourist.find(params[:id])
		if @tourist.id != current_tourist.id
			redirect_to tourist_path(current_tourist.id)
		end
	end

	def update
		@tourist = Tourist.find(params[:id])
		if @tourist.update(tourist_params)
			redirect_to tourist_path(@tourist), notice: "successfully updated!"
		else
			render "edit"
		end
	end

	def delete_me
		@tourist = Tourist.find(params[:id])
	end

	def withdraw
		@tourist = Tourist.find(params[:id])
		@tourist.status = 1
		@tourist.save
		sign_out
		redirect_to root_path
	end

	private
	def tourist_params
		params.require(:tourist).permit(:first_name, :last_name, :birthday, :gender, :nationality, :phone, :profile_image, :introduction,  :status)
	end
end
