class Post < ActiveRecord::Base
    has_many :comments
    has_many :likes
    
    resourcify
    include Authority::Abilities
    belongs_to :user
    validates :title,           
        presence: true    
    validates :content,            
        presence: true
end
