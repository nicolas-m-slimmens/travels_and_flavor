class NewsLetterInteractor
  include Delayed::RecurringJob
  run_every 1.day
  run_at '00:00am'
  timezone 'UTC'
  queue 'news-letter'

  def perform
    articles = Article.to_send

  end
end