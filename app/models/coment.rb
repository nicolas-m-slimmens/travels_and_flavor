class Coment < ActiveRecord::Base
  belongs_to :article
  belongs_to :user
  belongs_to :category
end
