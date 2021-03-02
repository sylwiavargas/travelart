class Destination < ApplicationRecord

    has_many :posts
    has_many :bloggers, through: :posts

    def most_recent_posts
        # byebug
        posts.last(5)
    end

    def featured
        posts.max_by{|post| post.likes}
        # posts.max_by(&:likes)
    end

    def average_blogger_age
        total_age = bloggers.uniq.sum{|blogger| blogger.age}
        total_age.to_f / bloggers.uniq.length
    end
end

# 	- The most recent 5 posts written about this destination
	# - A link to a featured post (this destination's post with the most likes)
	# - The average age of all unique bloggers who have written about this destination.