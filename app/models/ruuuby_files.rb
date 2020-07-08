# coding: UTF-8

# -------------------------------------------- ⚠️ --------------------------------------------

class RuuubyFile < ApplicationRecord

  belongs_to :ruuuby_dir, class_name: 'RuuubyDir'

  # useful components for any expression parsing
  module Syntax

    # expression from: https://stackoverflow.com/questions/6416065/c-sharp-regex-for-file-paths-e-g-c-test-test-exe/42036026#42036026
    #
    # @type [String]
    UNIX_PATH = '\/$|(^(?=\/)|^\.|^\.\.|^\~|^\~(?=\/))(\/(?=[^/\0])[^/\0]+)*\/?'.❄️

    # @type [String]
    UID       = UNIX_PATH

    # @type [String]
    SQL_UID   = 'path_full = ?'.❄️

    ❄️
  end

  include ::Ruuuby::ORMAttribute::Includable::UID

  validates :path_full, presence: true
  validates :name, presence: true
  #validates :extensions, presence: true
  #validates :is_virtual, presence: true

  # wip
  #
  def self.spawn(full_path, name, extensions, as_virtual, ruuuby_directory)
    🛑str❓(:full_path, full_path)
    🛑bool❓('is_virtual', as_virtual)
    ruuuby_file = RuuubyFile.create!(path_full: full_path, name: name, extensions: extensions, is_virtual: as_virtual, ruuuby_dir_id: ruuuby_directory)
    ruuuby_file.save!
    ruuuby_file
  end

  def self.generate_query_uid(*args)
    🛑 ArgumentError.new("| c{RuuubyFile}-> m{generate_query_uid} received{#{args.𝔠.to_s}} args when exactly{1} is required |") if (args.∅? || args.𝔠 > 1)
    🛑str❓(:arg0, args[0], :∉∅)
    ::RuuubyFile.where(::RuuubyFile::Syntax::SQL_UID, args[0])
  end

  🙈

  # @param [Symbol] cache_key
  #
  # @raise [RuntimeError]
  #
  # @return [Array]
  def cache_calculate(cache_key)
    case(cache_key)
    when :uid
      return self.path_full
    else
      raise "c{RuuubyFile}-> m{cache_calculate} did not recognize cache_key{#{cache_key.to_s}} of type{#{cache_key.Ⓣ}}"
    end
  end

end

# -------------------------------------------- ⚠️ --------------------------------------------
