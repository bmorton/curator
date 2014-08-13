require 'riak'
require 'curator/riak/last_updated_resolver'

module Curator::Riak
  class Configuration
    include Curator::Configuration

    attr_accessor :bucket_prefix, :riak_config_file

    def initialize
      ::Riak.escaper = CGI
      ::Riak.disable_list_keys_warnings = true
      ::Riak::RObject.on_conflict do |robject|
        LastUpdatedResolver.resolve(robject)
      end
    end

    def data_store
      Curator::Riak::DataStore.new
    end
  end
end
