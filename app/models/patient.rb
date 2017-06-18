class Patient < ApplicationRecord
  include PgSearch

  pg_search_scope :search_by_fullname, :against => [:firstname, :lastname]

  has_many :medical_attachments
  accepts_nested_attributes_for :medical_attachments
end
