# encoding: UTF-8

module ::Rugged
  class Diff
    class Delta
      def size_delta; self.old_file[:size] - self.new_file[:size]; end
    end
  end

  class Commit
    # @return [Boolean]
    def ∅?; false; end
  end
end
