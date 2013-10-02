class Comment < ActiveRecord::Base
  attr_accessible :body, :author, :post_id

  validates_presence_of :body, :author

  belongs_to :post
end
