class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  def get_post
    return post
  end
end
