class AddAttachmentDressImgToDresses < ActiveRecord::Migration[5.2]
  def self.up
    change_table :dresses do |t|
      t.attachment :dress_img
    end
  end

  def self.down
    remove_attachment :dresses, :dress_img
  end
end
