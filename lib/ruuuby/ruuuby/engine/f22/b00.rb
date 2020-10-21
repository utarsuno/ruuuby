# encoding: UTF-8

module ::Ruuuby::MetaData
  class RuuubyEngine

# TODO: implement once needed/more benefit in doing so
#  * https://stackoverflow.com/questions/6067139/ruby-garbage-collect
#  * https://stackoverflow.com/questions/11912750/ruby-big-array-and-memory
#  * https://samsaffron.com/archive/2013/11/22/demystifying-the-ruby-gc
#  * https://www.speedshop.co/2017/03/09/a-guide-to-gc-stat.html
#  # https://bugs.ruby-lang.org/projects/ruby-master/wiki/RGenGC
#  # https://medium.com/@zanker/the-ruby-vm-and-how-apps-break-part-2-e8b4620ad50d
#  # https://github.com/ruby/ruby/blob/v2_7_0/gc.c#L258
#  # https://blog.peterzhu.ca/notes-on-ruby-gc/
#
# # TODO: https://ruby-doc.org/stdlib-2.6.3/libdoc/objspace/rdoc/ObjectSpace.html
# # TODO: https://tenderlovemaking.com/2017/09/27/visualizing-your-ruby-heap.html
#
# @see https://ruby-doc.org/core-2.7.1/GC.html
# @see https://ruby-doc.org/core-2.7.1/GC/Profiler.html
#
# @see following sources for notes marked below:
#  - http://tmm1.net/ruby21-rgengc/
#  - https://engineering.appfolio.com/appfolio-engineering/2018/1/2/how-ruby-uses-memory
#
#  ‣ `Ruby` divides the heap into two sections:
#    ‣ protected    | `FL_WB_PROTECTED`                                          | promotable to `oldgen`
#    ‣ un-protected | missing `write-barrier`; un-safe access from `C-extension` | not promotable but can be remembered
#
#  ‣ `pages` in `heap` either belong in `eden` or `tomb`
#    ‣ `eden`      | has pages w/ live objects
#    ‣ `tomb`      | has pages w/o any objects
#    ‣ `ruby_heap` | `tomb` + `eden`
#
#  ‣ expected stats: (⚠️: depends on version and build settings)
#    ‣ object slot       | 40-bytes
#    ‣ # of object slots | 408 (per 16kb memory page)
#
#  ‣ an object that does not fit into this 40 byte slot will get assigned both a slot and heap-space (usually allocated via standard `malloc` route)
#
# ==extension_functions
#  - mem_usage_peak | returns Integer
    module F22B00

      # @return [Hash] the result from func{verify_compaction_references}
      def self.verify
        ::GC.verify_internal_consistency
        ::GC.verify_transient_heap_internal_consistency
        result = ::GC.verify_compaction_references
        💎.engine.debug(result.to_s)
        result
      end

      # @see https://stackoverflow.com/questions/7220896/get-current-ruby-process-memory-usage
      #
      # @return [Float]
      def self.total_memory_usage_current; 💻("ps ax -o pid,rss | grep -E \"^[[:space:]]*#{$$}\"").♻️⟶(' ').to_f; end

      def self.perform_full
        ::GC.enable
        ::GC.start(full_mark: true, immediate_sweep: true)
        #::GC.compact
      end

      def self.perform_quick
        ::GC.start(full_mark: false, immediate_sweep: false)
      end

      # @see source for formula & source credit: https://engineering.appfolio.com/appfolio-engineering/2018/1/2/how-ruby-uses-memory#
      #
      # @return [Float] the % of `heap memory` not being efficiently utilized
      def self.percentage_fragmentation
        stats              = ::GC.stat
        ratio_memory_filled = stats[:heap_live_slots].to_f / (stats[:heap_eden_pages] * self.stats_slots_per_heap_page)
        return 1.0 - ratio_memory_filled
      end

      # @return [Float] the % of `Ruby Objects` marked as `oldgen` and won't be scanned during a minor mark garbage collection
      def self.percentage_protected_from_minor_marks(with_remembered_objects_too=false)
        stats = ::GC.stat
        if with_remembered_objects_too
          ((stats[:old_objects] + stats[:remembered_wb_unprotected_objects]) / stats[:heap_live_slots].to_f) * 100.0
        else
          (stats[:old_objects] / stats[:heap_live_slots].to_f) * 100.0
        end
      end

      # @return [Boolean] true, if the GC has `stress` mode enabled
      def self.overclocked?; ::GC.stress != false; end

      # @return [Boolean] true, if the GC Profiler is currently enabled
      def self.profiler?; ::GC::Profiler.enabled?; end

      # ENV_VARs FOR GC
      #
      # # TODO: tune these for ex. a quick/short-lived script mode and for a long-process/server mode
      # # TODO: create ORM for ENV_VARs lol
      #
      # | ENV_VAR                          | default value     | notes                   |
      # | -------------------------------- | ----------------- | ----------------------- |
      # | GC_HEAP_INIT_SLOTS               | 10000             |                         |
      # | GC_HEAP_FREE_SLOTS               | 4096              |                         |
      # | GC_HEAP_GROWTH_FACTOR            | 1.8               |                         |
      # | GC_HEAP_GROWTH_MAX_SLOTS         | 0                 | 0 disables a max growth |
      # | GC_HEAP_OLDOBJECT_LIMIT_FACTOR   | 2.0               |                         |
      # | GC_HEAP_FREE_SLOTS_MIN_RATIO     | 0.20              |                         |
      # | GC_HEAP_FREE_SLOTS_GOAL_RATIO    | 0.40              |                         |
      # | GC_HEAP_FREE_SLOTS_MAX_RATIO     | 0.60              |                         |
      # | GC_MALLOC_LIMIT_MIN              | 16 * 1024 * 1024  | 16MB                    |
      # | GC_MALLOC_LIMIT_MAX              | 32 * 1024 * 1024  | 32MB                    |
      # | GC_MALLOC_LIMIT_GROWTH_FACTOR    | 1.4               |                         |
      # | GC_OLDMALLOC_LIMIT_MIN           | 16 * 1024 * 1024  |                         |
      # | GC_OLDMALLOC_LIMIT_GROWTH_FACTOR | 1.2               |                         |
      # | GC_OLDMALLOC_LIMIT_MAX           | 128 * 1024 * 1024 | 128MB                   |

      # @return [Float]
      def self.stats_bytes_per_object_slot; ::GC::INTERNAL_CONSTANTS[:RVALUE_SIZE].to_f; end

      # @return [Float]
      def self.stats_slots_per_heap_page; ::GC::INTERNAL_CONSTANTS[:HEAP_PAGE_OBJ_LIMIT].to_f; end

    end

    # @return [Ruuuby::MetaData::RuuubyEngine::F22B00]
    def gc; ::Ruuuby::MetaData::RuuubyEngine::F22B00; end
  end
end
