class Article < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  scope :to_send, -> { where(send_news: false) }

  scope :published, -> { where('published IS TRUE AND (available_from IS NULL OR available_from < now())') }

  acts_as_votable

  acts_as_commontable

  def next
    self.class.where('id > ?', id).first
  end

  def previous
    self.class.where('id < ?', id).last
  end

  def is_published?
    self.published && (self.available_from.nil? || self.available_from < Time.now)
  end

end
