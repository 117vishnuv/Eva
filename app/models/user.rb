class User < ApplicationRecord
  # enables a user to follow many other users 
  has_many :followed_users, foreign_key: :follower_id, class_name: 'Follow'
  #user has many followees through the followed_users established in the line above.
  has_many :followees, through: :followed_users

  #to create reverse as above 2
  has_many :following_users, foreign_key: :followee_id, class_name: 'Follow'
  has_many :followers, through: :following_users
  

  #uploading profile images
  mount_uploader :profile_image, ProfileImageUploader
  # validates_presence_of :profile_image
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
