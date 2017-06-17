require 'elasticsearch/model'

class Patient < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
end
