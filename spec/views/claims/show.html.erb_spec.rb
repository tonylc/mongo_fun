require 'spec_helper'

describe "claims/show.html.erb" do
  before(:each) do
    @claim = assign(:claim, stub_model(Claim,
      :name => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
