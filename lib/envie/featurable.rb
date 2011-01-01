module Envie
  module Featurable
    def feature(name)
      if Envie.has?(name)
        yield
      else
        nil
      end
    end
  end
end