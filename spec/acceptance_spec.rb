require 'spec_helper'

describe Envie do
  
  context "when using features" do
    it "should make them available at production" do
      Envie.production.with(:products)
      Envie.production.has?(:products).should be_true
      
      Envie.has?(:products).should be_true
      Envie.has?(:open_id).should be_false
      
      feature(:products) do
        "do something"
      end.should == "do something"
      
      feature(:open_id) do
        "do something"
      end.should be_nil
    end
    
    context "after deriving a child enviroment" do
    
      it "should register it globally" do
        Envie.production.with(:products).derive(:test)
        Envie.test.has?(:products).should be_true
      end
      
    end

    context "and using children enviroments" do
    
      it "should make them available" do
        production = Envie.production.with(:planets)
        homolog = production.derive(:homolog).with(:openid)
        homolog.derive(:development).with(:jquery)
        
        Envie.has?(:jquery).should be_false
        
        Envie.use(:homolog)
        Envie.has?(:planets).should be_true
        Envie.has?(:openid).should be_true
        Envie.has?(:jquery).should be_false
      end
      
    end
    
  end
  
end
