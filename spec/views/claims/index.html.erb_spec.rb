require 'spec_helper'

describe "claims/index.html.erb" do
  before(:each) do
    assign(:claims, [
      stub_model(Claim,
        :name => ""
      ),
      stub_model(Claim,
        :name => ""
      )
    ])
  end

  it "renders a list of claims" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
