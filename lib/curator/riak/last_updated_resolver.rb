module Curator
  module Riak
    module LastUpdatedResolver
      def self.resolve(robject)
        eligible_siblings = robject.siblings.select do |s|
          s.content_type == "application/json" && s.data["updated_at"]
        end

        sorted_siblings = eligible_siblings.sort_by do |s|
          DateTime.parse(s.data["updated_at"])
        end

        if sorted_siblings.any?
          robject.siblings = [sorted_siblings.last]
        end

        robject
      end
    end
  end
end
