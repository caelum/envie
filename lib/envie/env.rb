module Envie
  class Env
    
    def features
      @features ||= []
    end
    
    def with(feature)
      features << feature
      self
    end
    
    def has?(name)
      features.include?(name) || (@parent && @parent.has?(name))
    end
    
    def derive(child)
      Envie.at(child).from(self)
    end
    
    def from(parent)
      @parent = parent
      self
    end
    
  end
end
