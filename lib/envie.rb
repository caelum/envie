require 'envie/env'
require 'envie/featurable'
module Envie
  class << self
    
    attr_reader :current
    
    def all
      @envs ||= {}
    end
    
    def method_missing(name)
      at(name)
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

class Object
  include Envie::Featurable
end