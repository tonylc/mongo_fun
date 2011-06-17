class CustomersController < ApplicationController
  before_filter :set_claim

  def new
    @customer = Customer.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @customer = @claim.customers.find(params[:id])
  end
  
  def create
    @customer = @claim.customers.create(params[:customer])

    respond_to do |format|
      if @customer.save
        format.html { redirect_to(@claim, :notice => 'Customer was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @customer = @claim.customers.find(params[:id])

    respond_to do |format|
      if @customer.update_attributes(params[:customer])
        format.html { redirect_to(@claim, :notice => 'Customer was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end
  
  private
  
  def set_claim
    @claim = Claim.find(params[:claim_id])
  end
end
