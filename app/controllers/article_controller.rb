class ArticleController < ApplicationController

  before_action :find_article, only: [:edit, :update, :show, :destroy, :vote_up, :vote_down]

  def index
    if can? :manage, Article
      @articles = Article.all
    else
      @articles = Article.published
    end

    unless params[:category_id].nil?
      @articles = @articles.where(category_id: params[:category_id])
    end
  end

  def show
    unless @article.is_published?
      unless can? :manage, Article
        raise ActionController::RoutingError.new('Not Found')
      end
    end
  end

  def new
    authorize! :manage, @article
    @article = Article.new
  end

  def create
    authorize! :manage, @article
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
    authorize! :manage, @article
  end

  def update
    authorize! :manage, @article
    if @article.update_attributes(article_params)
      flash[:notice] = 'Articulo actualizado con exito'
      redirect_to article_path(@article)
    else
      flash[:alert] = 'Error al actualizar articulo'
      render :edit
    end
  end

  def destroy
    authorize! :manage, @article
    if @article.destroy
      flash[:notice] = 'Articulo eliminado con exito'
      redirect_to article_index_path
    else
      flash[:alert] = 'Error al eliminar articulo'
    end
  end

  def vote_up
    @article.upvote_from(current_user)
    respond_to do |format|
      format.json { render :json => {:status => :ok}.to_json }
    end
  end

  def vote_down
    @article.downvote_from(current_user)
    respond_to do |format|
      format.json { render :json => {:status => :ok}.to_json }
    end
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body, :available_from, :category_id, :description, :published, :image, :tags)
  end

end
