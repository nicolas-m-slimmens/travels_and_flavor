class ArticleController < ApplicationController

  before_action :find_article, only: [:edit, :update, :show, :destroy, :vote_up, :vote_down]

  load_and_authorize_resource

  def index
    if params[:category_id].nil?
      @articles = Article.published
    else
      @articles = Article.published.where(category_id: params[:category_id])
    end

  end

  def show

  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(article_params)
    if @article.save(article_params)
      flash[:notice] = 'Articulo creado con exito'
      redirect_to article_path(@article)
    else
      flash[:alert] = 'Error al crear nueva articulo'
      puts @article.errors.full_messages
      puts @article.errors.inspect
      render :new
    end
  end

  def edit

  end

  def update
    if @article.update_attributes(article_params)
      flash[:notice] = 'Articulo actualizado con exito'
      redirect_to article_path(@article)
    else
      flash[:alert] = 'Error al actualizar articulo'
      render :edit
    end
  end

  def destroy
    if @article.destroy
      flash[:notice] = 'Articulo eliminado con exito'
      redirect_to article_index_path
    else
      flash[:alert] = 'Error al eliminar articulo'
    end
  end

  def vote_up
    @article.upvote_from(current_user)
    render :nothing => true, :status => 200, :content_type => 'text/html'
  end

  def vote_down
    @article.downvote_from(current_user)
    render :nothing => true, :status => 200, :content_type => 'text/html'
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body, :available_from, :category_id, :description, :published, :image, :tags)
  end

end
