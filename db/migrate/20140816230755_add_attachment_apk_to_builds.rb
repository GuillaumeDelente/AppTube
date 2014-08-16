class AddAttachmentApkToBuilds < ActiveRecord::Migration
  def self.up
    change_table :builds do |t|
      t.attachment :apk
    end
  end

  def self.down
    drop_attached_file :builds, :apk
  end
end
