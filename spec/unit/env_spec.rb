require 'spec_helper'

describe Envie::Env do
  
  context "when adding features" do
    it "should have them available" do
      prod = Envie::Env.new.with(:products)
      prod.has?(:products).should be_true
      prod.has?(:clients).should be_false
    end
    
    it "should have them available out of its parents" do
      child = Envie::Env.new.with(:products).derive(:child)
      child.has?(:products).should be_true
    end
    
    it "should have them available out of its parents" do
      child = Envie::Env.new.with(:products).derive(:child).with(:oauth)
      child.has?(:oauth).should be_true
    end
    
  end
  
end
