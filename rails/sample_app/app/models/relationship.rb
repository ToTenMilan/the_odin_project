class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  validates :follower_id, presence: true # ex. 14.1.3.1 the tests checking validity still pass* after commenting out these two lines
  validates :followed_id, presence: true # as above. Check explanation at the bottom
end

# *(This is a change as of Rails 5, and in previous versions of Rails the validations are required. We’ll plan to leave them in for completeness, but it’s worth bearing in mind that you may see these validations omitted in other people’s code.)
