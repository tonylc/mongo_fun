require 'spec_helper'

describe "claims/edit.html.erb" do
  before(:each) do
    @claim = assign(:claim, stub_model(Claim,
      :name => ""
    ))
  end

  it "renders the edit claim form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => claims_path(@claim), :method => "post" do
      assert_select "input#claim_name", :name => "claim[name]"
    end
  end
end
