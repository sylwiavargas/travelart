class Post < ApplicationRecord
    after_initialize :set_likes
    belongs_to :blogger
    belongs_to :destination

    validates :title, presence: true
    validates :content, length: {minimum: 100}

    def formatted_content
        content.split(/[\[\\\]"]/).join("")
    end

    def set_likes
        self.likes = 0 if likes.nil?
    end
end
