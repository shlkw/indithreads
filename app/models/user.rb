class User < ApplicationRecord
has_secure_password
  has_many :dresses
  has_attached_file :avatar_img, styles: {avatar_show: "300x300>", avatar_thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar_img, content_type: /\Aimage\/.*\z/
  validates :email, presence: true, uniqueness: true
end
