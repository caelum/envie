require 'envie/env'
require 'envie/featurable'
module Envie
  class << self

    attr_reader :current

    def all
      @envs ||= {}
    end

    def method_missing(name)
      if name =~ /^(.*)\?$/
        feature = $1.to_sym
        has?(feature)
      else
        at(name)
      end
    end

    def at(name)
      all[name] ||= Env.new
    end

    def has?(name)
      @current.has?(name)
    end

    def use(name)
      @current = at(name)
    end

  end

  Envie.use :production
end
