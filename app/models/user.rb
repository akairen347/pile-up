class User < ApplicationRecord
  # has_secure_passwordメソッドを追加してください
  has_secure_password
  
  validates :name, {presence: true}
  validates :email, {presence: true, uniqueness: true}

  
  has_many :posts
  
  def posts
    return Post.where(user_id: self.id)
  end





#twitter認証の
  def self.find_or_create_from_auth_hash(auth_hash)
    provider = auth_hash[:provider]
    uid = auth_hash[:uid]
    name = auth_hash[:info][:name]
    image_url = auth_hash[:info][:image]
 
    
    self.find_or_create_by(provider: provider,uid: uid) do |user|
      user.username = name
      user.image_url = image_url
    end
   end
   #twitter認証の
  
end