class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :set_user
  before_action :check_owner, only: [:edit, :update, :destroy]
  before_action :check_admin, only: [:new, :create, :edit, :update, :destroy]
  access all: [:index], user: [:index, :show], editor: :all, admin: {except: [:new, :edit, :update, :destroy]}

  # GET /articles
  def index
    @articles = Article.all
  end

  # GET /articles/1
  def show
  end

  # GET /articles/new
  def new
    if @user
      @article = @user.articles.new
    end
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article, notice: 'Article was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /articles/1
  def update
    if @article.update(article_params)
      redirect_to @article, notice: 'Article was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /articles/1
  def destroy
    @article.destroy
    redirect_to articles_url, notice: 'Article was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    def set_user
      @user = current_user if user_signed_in?
    end

    def check_owner
      if user_signed_in?
        if @article.user_id != current_user.id
          redirect_to article_url(@article), notice: 'Permission Denied'
        end
      end
    end

    def check_admin
      if user_signed_in? && logged_in?(:admin)
        redirect_to articles_url, notice: 'Permission Denied'
      end
    end

    # Only allow a trusted parameter "white list" through.
    def article_params
      params.require(:article).permit(:title, :content, :category_id, :user_id)
    end
end
