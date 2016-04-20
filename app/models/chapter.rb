class Chapter < ActiveRecord::Base
  belongs_to :story

  validates :title, :position, :story, presence: true
end
