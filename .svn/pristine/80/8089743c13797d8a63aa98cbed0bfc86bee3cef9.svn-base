class AddAttachmentContentToPhotos < ActiveRecord::Migration
  def self.up
    change_table :photos do |t|
      t.attachment :content
    end
  end

  def self.down
    drop_attached_file :photos, :content
  end
end
