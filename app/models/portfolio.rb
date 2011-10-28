class Portfolio < ActiveRecord::Base

  acts_as_indexed :fields => [:title, :description, :url]

  validates :title, :presence => true, :uniqueness => true
  
  belongs_to :picture, :class_name => 'Image'
end
