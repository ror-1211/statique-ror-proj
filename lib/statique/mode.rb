# frozen_string_literal: true

module Statique
  class Mode
    MODE_BUILD = "build"
    MODE_SERVER = "server"
    MODES = [MODE_BUILD, MODE_SERVER].freeze

    def initialize(mode = MODE_SERVER)
      raise ArgumentError, "Mode can't be empty" if mode.nil? || mode.empty?
      raise ArgumentError, "Mode must be one of #{MODES}" unless MODES.include?(mode.to_s)

      @mode = mode.to_s
    end

    def server!
      @mode = MODE_SERVER
    end

    def build!
      @mode = MODE_BUILD
    end

    def server?
      @mode == MODE_SERVER
    end

    def build?
      @mode == MODE_BUILD
    end

    def server(&blk)
      blk&.call if server?
    end

    def build(&blk)
      blk&.call if build?
    end
  end
end
