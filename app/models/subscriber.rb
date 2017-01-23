class Subscriber < ActiveRecord::Base
  validates_presence_of :mail
end
