class Plant < ApplicationRecord
    
  has_one_attached :image
  belongs_to :user
  has_many :plant_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  validates :plant_name, presence: true
  validates :image, presence: true
  
  def get_image
     unless image.attached?
       file_path = Rails.root.join('app/assets/images/no_image.jpg')
       image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
     end
     image
  end 
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  
  def self.ransackable_attributes(auth_object = nil)
    ["caption", "created_at", "id", "plant_name", "updated_at", "user_id"]
  end
  
end
