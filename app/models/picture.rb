class Picture < ActiveRecord::Base
  attr_accessible :caption, :source

  belongs_to :admin
end
