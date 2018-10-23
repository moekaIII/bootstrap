class BlogsController < ApplicationController
  before_action :set_blog, only:[:show, :update, :destroy]
  before_action :user_check, only:[:edit]

  def list
    @blogs = Blog.all
  end

  def new
    if params[:back]
      @blog = Blog.new(blog_params)
    else
      @blog = Blog.new
    end
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    if @blog.save
      CreateMailer.create_mail(@blog).deliver
      redirect_to list_blogs_path, notice: "ブログを作成しました！"
    else
      render 'new'
    end
  end

  def show
    @favorite = current_user.favorites.find_by(blog_id: @blog.id)
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "ブログを編集しました！"
    else
      render 'edit'
    end
  end

  def destroy
    @blog.destroy
    redirect_to list_blogs_path, notice:"ブログを削除しました！"
  end

  def confirm
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    render :new if @blog.invalid?
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :content)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def user_check
    @blog_id = Blog.find(params[:id]).user_id
    if @blog_id == current_user.id
      @blog = Blog.find(params[:id])
    else
      redirect_to list_blogs_path
    end
  end
end
