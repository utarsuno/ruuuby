# encoding: UTF-8

# utilize class +ApplicationRecord+ as a location for any re-usable ORM functionality & abstraction
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
