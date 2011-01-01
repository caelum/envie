require 'spec_helper'

describe Envie::Featurable do
  
  context "when in the wrong scope" do
    it "should not invoke its block" do
      Envie.should_receive(:has?).with(:non_existing).and_return(false)
      Object.new.extend(Envie::Featurable).feature(:non_existing) do
        fail "should never invoke because the feature is not available"
      end
    end
  end
  
  context "when in the correct scope" do
    it "should invoke its block" do
      Envie.should_receive(:has?).with(:existing).and_return(true)
      Object.new.extend(Envie::Featurable).feature(:existing) do
        "executed!"
      end.should == "executed!"
    end
  end
  
end