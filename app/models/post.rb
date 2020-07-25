# frozen_string_literal: true

class Post < ActiveRecord::Base
  belongs_to :user
  has_many :sections

  def self.list_by_most_recent
    all.sort_by(&:created_at).reverse
  end

  def url 
    "/users/#{user.id}/posts/#{id}"
  end
end
