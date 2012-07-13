class Graph < ActiveRecord::Base
  attr_accessible :description, :image, :source
  belongs_to :user
  
  validates :description, length: { maximum: 500 }
  validates :user_id, presence: true
  validates :image, presence: true
  validates :source, presence: true

  default_scope order: 'graphs.created_at DESC'
end
