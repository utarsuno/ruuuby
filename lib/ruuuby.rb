# coding: utf-8

require 'ruby_class_mods'

# wip: *Ruuuby* is flavored modifications & extensions for increased quality of Ruby coding life
module ::Ruuuby

  # 'Does there exist a global-scoped Module named X?'
  #
  # @param [String] module_name
  # @param [*] owner (default: Kernel)
  #
  # @return [Boolean] true, if a global-scoped Module was found with matching name
  def self.∃module?(module_name, owner=Kernel)
    self.∃_under?(module_name, ::Module, owner)
  end

  # 'Does there exist a global-scoped Class named X?'
  #
  # @param [String] class_name
  # @param [*] owner (default: Kernel)
  #
  # @return [Boolean] true, if a global-scoped Class was found with matching name
  def self.∃class?(class_name, owner=Kernel)
    self.∃_under?(class_name, ::Class, owner)
  end

private

  # @param [String] name
  # @param [*] class_type
  # @param [*] owner
  #
  # @return [Boolean] true, if a field with provided name and class was found in global-scope
  def self.∃_under?(name, class_type, owner)
    owner.const_defined?(name) && owner.const_get(name).instance_of?(class_type)
  end
end
