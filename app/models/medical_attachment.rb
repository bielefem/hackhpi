class MedicalAttachment < ApplicationRecord
  belongs_to :patient

  has_attached_file :file
  validates_attachment_content_type :file, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif", "application/pdf"]

  def file_url
    file.url(:medium)
  end
end
