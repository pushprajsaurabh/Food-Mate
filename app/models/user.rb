class User < ActiveRecord::Base
  # attr_accessible :email, :password, :password_confirmation
  # attr_accessor :password
  # before_save :encrypt_password
  
  validates_presence_of :phone
  validates_uniqueness_of :phone

  has_secure_password

  has_many :user_friends
  has_many :friends, :through => :user_friends
              # foreign_key: :user_id, 
              # association_foreign_key: :friend_user_id
  # attr_accessible :email, :password, :password_confirmation

  def detect_and_update_match
    friends = self.user_friends
    has_new_match = friends.blank? ? false : friends.first.is_new_match 
    friends.update_all(:is_new_match => false) if friends.present? && has_new_match
    return has_new_match
  end
end
