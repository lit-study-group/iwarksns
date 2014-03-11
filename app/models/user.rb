# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  has_secure_password
  validates :name, :email, presence: true

  has_and_belongs_to_many :friends, join_table: 'friendships',
                                    class_name: 'User',
                                    association_foreign_key: 'friend_id'

  has_many :posts
  has_many :comments

  before_create :initialize_token!

  def owns_post?(post)
    posts.where(id: post.id).exists?
  end

  def owns_comment?(comment)
    comments.where(id: comment.id).exists?
  end

  def friend?(user)
    friends.where(id: user.id).exists?
  end

  def initialize_token!
    return unless self.token.nil?
    self.token = loop do
      token = SecureRandom.urlsafe_base64(20, false)
      break token unless User.exists?(token: token)
    end
    self.save!
  end

  def become_friend(friend)
    User.transaction do
      self.friends << friend
      friend.friends << self
    end
  end

  def remove_friend(friend)
    User.transaction do
      self.friends.delete(friend)
      friend.friends.delete(self)
    end
  end
end
