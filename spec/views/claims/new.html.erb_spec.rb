require 'spec_helper'

describe "claims/new.html.erb" do
  before(:each) do
    assign(:claim, stub_model(Claim,
      :name => ""
    ).as_new_record)
  end

  it "renders new claim form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => claims_path, :method => "post" do
      assert_select "input#claim_name", :name => "claim[name]"
    end
  end
end
