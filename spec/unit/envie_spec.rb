require 'spec_helper'

describe Envie do

  context "using envie" do

    it "should not duplicate environments at each call" do
      Envie.extra.should == Envie.extra
    end

    it "using should change current the one" do
      Envie.use(:extra)
      Envie.current.should == Envie.extra
    end

    it "should check with the current scope" do
      Envie.current.should_receive(:has?).with(:magic).and_return(true)
      Envie.has?(:magic).should == true
    end

    it "should check with the current scope" do
      Envie.current.should_receive(:has?).with(:magic).and_return(true)
      Envie.has?(:magic).should == true
    end

    it "should respond to foo? like has?(:foo)" do
      Envie.current.should_receive(:has?).with(:magic).and_return(true)
      Envie.magic?.should == true
    end
  end

end
