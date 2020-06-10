
# -------------------------------------------- ⚠️ --------------------------------------------

class RuuubyDir < ApplicationRecord

  # useful components for any expression parsing
  module Syntax
  end

  #include ::ApplicationRecord::ORMAttributeUID
  #include ::Ruuuby::Attribute::Includable::SyntaxCache

  validates :path_full, presence: true
  validates :name, presence: true
  #validates :is_virtual, presence: true

  has_many :ruuuby_files, class_name: 'RuuubyFile'

  has_many :ruuuby_dirs, class_name: 'RuuubyDir', foreign_key: 'parent_dir_id'
  belongs_to :parent_dir, class_name: 'RuuubyDir', optional: true

  def self.spawn(path_full, name, is_virtual)
    🛑str❓($PRM_MANY, [path_full, name])
    🛑bool❓(:is_virtual, is_virtual)
    if ::Dir.∃?(path_full)
      ruuuby_dir = RuuubyDir.create!(
          path_full: path_full,
          name: name,
          is_virtual: is_virtual
      )
      ruuuby_dir.save!
      ruuuby_dir
    else
      🛑 ArgumentError.new("| c{RuuubyDir}-> m{spawn} got path{#{path_full}} which DNE")
    end
  end

  def spawn_dir(path, name, is_virtual)
    ruuuby_dir = ::RuuubyDir.spawn("#{self.path_full}#{path}", name, is_virtual)
    ruuuby_dir.save!
    ruuuby_dir.parent_dir=self
    ruuuby_dir.save!
    self.save!
    ruuuby_dir
  end

  def spawn_file(relative_path, name, extensions, is_virtual)
    ruuuby_file = ::RuuubyFile.spawn(
         relative_path,
         name,
         extensions,
         is_virtual,
         self.id
    )
    ruuuby_file.save!
    self.save!
    ruuuby_file
  end

end

# -------------------------------------------- ⚠️ --------------------------------------------
