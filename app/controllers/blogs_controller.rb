class BlogsController < ApplicationController
  def index
    @blogs = Blog.page(params[:page]).reverse_order
  end

  def search
    if params[:tourist_name].present?
      tourist_id = Tourist.where("first_name Like ? OR last_name Like ?", "%#{params[:tourist_name]}%", "%#{params[:tourist_name]}%").pluck(:id)
      @blogs = Blog.where(tourist_id: tourist_id)
      # @blogs = @blogs.get_by_tourist_name params[:tourist_name]
    else
      @blogs = Blog.all #name カラムが空の場合
    end

    # @blog = Blog.find(params[:blog_id])
    # @t = Tourist.where(blog_id: params[:id])
    # @t_id = @t.map{|f| f.tourist_id}
    # @tourist = @blogs.map{|| }

    # binding.pry
    if params[:guide_name].present?
      guide_id = Guide.where("first_name Like ? OR last_name Like ?", "%#{params[:guide_name]}%", "%#{params[:guide_name]}%").pluck(:id)
      @blogs = Blog.where(guide_id: guide_id)
    elsif params[:tourist_name].present?
      @blogs = Blog.where(tourist_id: tourist_id)
    else
      @blogs = Blog.all
    end
    if params[:title].present?
      @blogs = @blogs.get_by_title params[:title]
    end
    if params[:region].present?
      @blogs = @blogs.get_by_region params[:region]
    end
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if tourist_signed_in?
      @blog.tourist_id = current_tourist.id
      @blog.sender = true
    else
      @blog.guide_id = current_guide.id
      @blog.sender = false #実際はdefaultで定義されている
    end
    if @blog.save
      redirect_to blogs_path
    else
      render :new
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :region, :image, :body)
  end
end