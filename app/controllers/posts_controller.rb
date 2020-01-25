class PostsController < ApplicationController

  before_action :authenticate_user

  before_action :ensure_correct_user,{only:[:edit,:update,:destroy]}

  def index
    @post = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find_by(id: params[:id])
  end


  def new
    @post = Post.new
  end

  


  def create
    @post = Post.new(
      content: params[:content],
      type: params[:type],
      time: params[:time],
      user_id: @current_user.id
    )
    if @post.save
      redirect_to("/users/#{@current_user.id}")
    else
      render("posts/new")
      flash[:notice] = "投稿に失敗しました"
    end
  end



  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    @post.content = params.permit(:content)[:content]
    @post.time = params.permit(:time)[:time]
    @post.type = params.permit(:type)[:type]

    if @post.save
      redirect_to("/users/#{@current_user.id}")
      
    else
      render("posts/edit")
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to("/users/#{@current_user.id}")
  end

  

  def ensure_correct_user
    @post = Post.find_by(id: params[:id])
    if @post.user_id != @current_user.id
      flash[:notice]= "権限がありません"
      redirect_to("/posts/index")
    end
  end

end
