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

  has_many :posts

  def owns?(post)
    posts.where(id: post.id).exists?
  end
end
