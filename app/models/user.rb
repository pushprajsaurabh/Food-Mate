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
  # 
  has_attached_file :photo, 
  :styles => {
               :medium => {:geometry => "480x360", :format => "webp"},
               :small =>  {:geometry => "320x256", :format => "webp"} 
              },
  :storage => :s3,
  :s3_credentials => Rails.root.join("config/s3.yml"),
  :s3_host_name => 's3-ap-southeast-1.amazonaws.com',
  :s3_host_alias => ENV['IMAGES_CLOUDFRONT_CNAME'],
  :url => ':s3_alias_url',
  :path => ":class/:attachment/:id/:style"

  def detect_and_update_match
    friends = self.user_friends
    has_new_match = friends.blank? ? false : friends.first.is_new_match 
    friends.update_all(:is_new_match => false) if friends.present? && has_new_match
    return has_new_match
  end

  def get_url
  self.photo.url(:medium)
 end

  def to_user_hash
   return {
    :id => self.id,
    :name => self.name,
    :twitter_handle => self.twitter_handle,
    :phone => self.phone
   }
 end

end
