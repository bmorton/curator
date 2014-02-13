module Curator
  class VersionVectorMap
    def initialize
      @objects = {}
    end

    def add(options = {})
      object = options.fetch(:object)
      objects[object.object_id] = options.fetch(:version_vector)
    end

    def [](object_id)
      objects[object_id]
    end

  private

    attr_accessor :objects
  end
end
