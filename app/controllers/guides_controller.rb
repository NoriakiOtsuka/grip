class GuidesController < ApplicationController
	def top
		@guides = Guide.all
	end

	def show
		@guide = Guide.find(params[:id])
		if @guide.id != current_guide.id
			redirect_to guide_path(current_guide.id)
		end
	end

	def edit
		@guide = Guide.find(params[:id])
		if @guide.id != current_guide.id
			redirect_to guide_path(current_guide.id)
		end
	end

	def update
		@guide = Guide.find(params[:id])
		if @guide.update(guide_params)
			redirect_to guide_path(@guide), notice: "successfully updated!"
		else
			render "edit"
		end
	end

	def delete_me
		@guide = Guide.find(params[:id])
	end

	def withdraw
		@guide = Guide.find(params[:id])
		@guide.status = 1
		@guide.save
		#pry-byebug
		#sign_out
		redirect_to root_path
	end

	private
	def guide_params
		params.require(:guide).permit(:first_name, :last_name, :birthday, :gender, :address, :phone, :profile_image, :introduction, :region)
	end
end
