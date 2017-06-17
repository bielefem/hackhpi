class Patient < ApplicationRecord
  include PgSearch

  pg_search_scope :search_by_fullname, :against => [:firstname, :lastname]
end
