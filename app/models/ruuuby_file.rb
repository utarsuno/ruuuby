
# -------------------------------------------- ⚠️ --------------------------------------------

class RuuubyFile < ApplicationRecord

  belongs_to :ruuuby_dir, class_name: 'RuuubyDir'

  # useful components for any expression parsing
  module Syntax
  end

  #include ::ApplicationRecord::ORMAttributeUID
  #include ::Ruuuby::Attribute::Includable::SyntaxCache

  validates :path_full, presence: true
  validates :name, presence: true
  validates :extensions, presence: true
  validates :is_virtual, presence: true

end

# -------------------------------------------- ⚠️ --------------------------------------------
