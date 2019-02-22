class Dress < ApplicationRecord
belongs_to :user
has_attached_file :dress_img, styles: { dress_index: "700x700>", dress_show: "700x700>" }, default_url: "/images/:style/missing.png"
validates_attachment_content_type :dress_img, content_type: /\Aimage\/.*\z/

 scope :title, -> (title) { where( "title iLIKE :title", title: "%#{title}%" )}
 scope :price, -> (price) { where ( "price < ?" " #{price} ")}


def self.search(search)
    where(['title iLIKE ?', "%#{search}%"])
end 


  def self.search(search)
      where("title ILIKE :title", title: "%#{search}%") do |record|
        record.title
    end
    end

end
