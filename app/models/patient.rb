require 'elasticsearch/model'

class Patient < ApplicationRecord
  include PgSearch
end
