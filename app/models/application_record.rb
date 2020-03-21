# encoding: UTF-8

# utilize class +ApplicationRecord+ as a location for any re-usable ORM functionality & abstraction
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  alias_method :♻️, :destroy
  alias_method :♻️!, :destroy!

  # TODO: ADD CLASS EXTENSIONS

  # @abstract
  #
  # @return [String]
  #def uid ; raise RuntimeError.new('abstract m{uid} for c{ApplicationRecord} not implemented!') ; end

end
