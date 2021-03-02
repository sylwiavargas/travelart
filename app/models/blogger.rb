class Blogger < ApplicationRecord

    has_many :posts
    has_many :destinations, through: :posts

    validates :name, uniqueness: true
    validates :age, numericality: { greater_than: 0 }
    validates :bio, length: {minimum: 30}

    # def to_s
    #     name
    # end

    def total_likes
        # byebug
        posts.sum{|post| post.likes}
    end

    def most_liked_post
        posts.max_by{|post| post.likes}
    end

    def most_written_about_destinations
        hash = Hash.new(0)
        destinations.each{|destination| hash[destination] += 1}
        hash.sort_by{|k,v| v}[0..4].map{|array| array[0]}
    end 

end


# - The total likes on all of that blogger's posts
# 1. get the sum of all the likes
# 2. get the post that got the most likes
# 3. top 5 most written about destinations
# - A link to that blogger's featured post (the post with the most likes)
# - **BONUS** A list of that user's top 5 most written about destinations (the destinations with the most posts)