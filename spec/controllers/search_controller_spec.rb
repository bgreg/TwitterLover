require 'spec_helper'

describe SearchesController do
  it "should be able to instatiate the controller without errors" do
    expect{ SearchesController.new }.to_not raise_error
  end
  it "should be able to instatiate the controller without raising exception" do
    expect{ SearchesController.new }.to_not raise_exception
  end

end
