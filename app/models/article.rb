class Article < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  before_create :default

  scope :to_send, -> { where(send_news: false) }

  acts_as_votable

  acts_as_commontable

  def default
    self.send_news = false
  end

  def next
    self.class.where('id > ?', id).first
  end

  def previous
    self.class.where('id < ?', id).last
  end

end
