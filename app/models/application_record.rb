# encoding: UTF-8

# utilize class +ApplicationRecord+ as a location for any re-usable ORM functionality & abstraction
class ::ApplicationRecord < ActiveRecord::Base

  #    ___                                         __
  #  /'___\                                       /\ \__  __
  # /\ \__/  ___   _ __       _ __   __  __    ___\ \ ,_\/\_\    ___ ___      __
  # \ \ ,__\/ __`\/\`'__\    /\`'__\/\ \/\ \ /' _ `\ \ \/\/\ \ /' __` __`\  /'__`\
  #  \ \ \_/\ \L\ \ \ \/     \ \ \/ \ \ \_\ \/\ \/\ \ \ \_\ \ \/\ \/\ \/\ \/\  __/
  #   \ \_\\ \____/\ \_\      \ \_\  \ \____/\ \_\ \_\ \__\\ \_\ \_\ \_\ \_\ \____\
  #    \/_/ \/___/  \/_/       \/_/   \/___/  \/_/\/_/\/__/ \/_/\/_/\/_/\/_/\/____/

  self.abstract_class = true

  alias_method :♻️, :destroy
  alias_method :♻️!, :destroy!

  # @return [Integer]
  def self.length; self.all.length; end

  # @return [Integer]
  def self.num_where(*sql_query); self.where(*sql_query).count; end

  # @return [Boolean]
  def self.empty?; self.count == 0; end

  class << self
    alias_method :∅?, :empty?

    @orm_Ⓣ_🐍 = nil

    # @return [String]
    def orm_Ⓣ_🐍
      if @orm_Ⓣ_🐍.nil?
        @orm_Ⓣ_🐍 = self.name.to_🐍
      end
      @orm_Ⓣ_🐍
    end

  end

  #    ___                      __                          ___                                              __
  #  /'___\                    /\ \                        /\_ \                                            /\ \__
  # /\ \__/  ___   _ __        \_\ \     __   __  __     __\//\ \     ___   _____     ___ ___      __    ___\ \ ,_\
  # \ \ ,__\/ __`\/\`'__\      /'_` \  /'__`\/\ \/\ \  /'__`\\ \ \   / __`\/\ '__`\ /' __` __`\  /'__`\/' _ `\ \ \/
  #  \ \ \_/\ \L\ \ \ \/      /\ \L\ \/\  __/\ \ \_/ |/\  __/ \_\ \_/\ \L\ \ \ \L\ \/\ \/\ \/\ \/\  __//\ \/\ \ \ \_
  #   \ \_\\ \____/\ \_\      \ \___,_\ \____\\ \___/ \ \____\/\____\ \____/\ \ ,__/\ \_\ \_\ \_\ \____\ \_\ \_\ \__\
  #    \/_/ \/___/  \/_/       \/__,_ /\/____/ \/__/   \/____/\/____/\/___/  \ \ \/  \/_/\/_/\/_/\/____/\/_/\/_/\/__/
  #                                                                           \ \_\
  #                                                                            \/_/

  # @return [Class]
  def self.orm_class; ::Kernel.const_get(self.name); end

  # @param [String] str
  #
  # @return [Boolean] if the arg(`str`) can be converted into a specified represented `ORM` Class
  def self.str2ormⓣ?(str)
    ::Kernel.const_get(str).kind_of?(::ApplicationRecord)
  rescue
    false
  end

end
