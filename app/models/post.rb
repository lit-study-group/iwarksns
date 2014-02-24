# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  body       :text
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Post < ActiveRecord::Base
  belongs_to :author, foreign_key: 'user_id', class_name: 'User'

  delegate :name, to: :author, prefix: true

  default_scope { order(created_at: :desc) }

  has_many :comments

  def self.for_user(user)
    Post.limit(20)
  end
end
