class LandingController < ApplicationController

  def index
    @articles = Article.published.paginate(page: params[:page], per_page: 5).order('created_at DESC')
    @last_articles = @articles.first(3)
    @articles = @articles.where('id NOT IN (?)', @last_articles.map {|last_article| last_article.id})

    respond_to do |format|
      format.html
      format.js
    end
  end

end
