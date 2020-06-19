# encoding: UTF-8

# -------------------------------------------- ⚠️ --------------------------------------------

module ::Ruuuby

  module MetaData

    class AbstractSpace

      def initialize
        @spaces = {}
      end

      def add_space(space)
        if !@spaces.∃🔑?(space.name)
          @spaces[space.name] = space
          self.define_singleton_method("#{space.name}") do
            return space
          end
          space
        else
          🛑 RuntimeError.new("| self{#{self.to_s}} class{#{self.Ⓣ}}, func{add_space} called but there already exists a space w/ name{#{space.name}} |")
        end
      end

    end

    class SpaceAPI < AbstractSpace
      def name; "api_git"; end
    end

  end

end

# -------------------------------------------- ⚠️ --------------------------------------------
