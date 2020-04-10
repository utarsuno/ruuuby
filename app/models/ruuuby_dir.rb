
# -------------------------------------------- ⚠️ --------------------------------------------

class RuuubyDir < ApplicationRecord

  # useful components for any expression parsing
  module Syntax
  end

  #include ::ApplicationRecord::ORMAttributeUID
  #include ::Ruuuby::Attribute::Includable::SyntaxCache

  validates :path_full, presence: true
  validates :name, presence: true
  validates :is_virtual, presence: true

  has_many :ruuuby_files, class_name: 'RuuubyFile'

end

# -------------------------------------------- ⚠️ --------------------------------------------
