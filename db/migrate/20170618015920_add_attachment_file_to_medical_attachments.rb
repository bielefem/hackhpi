class AddAttachmentFileToMedicalAttachments < ActiveRecord::Migration[5.1]
  def self.up
    change_table :medical_attachments do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :medical_attachments, :file
  end
end
