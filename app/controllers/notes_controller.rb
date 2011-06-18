class NotesController < ApplicationController
  before_filter :set_claim

  def new
    @note = @claim.notes.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @note }
    end
  end

  def edit
    @note = @claim.notes.find(params[:id])
  end

  def create
    @note = @claim.notes.create(params[:note])

    respond_to do |format|
      if @note.save
        format.html { redirect_to(@claim, :notice => 'Note was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @note = @claim.notes.find(params[:id])

    respond_to do |format|
      if @note.update_attributes(params[:note])
        format.html { redirect_to(@claim, :notice => 'Note was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def show
    @note = @claim.notes.find(params[:id])

    respond_to do |format|
      format.json { render :json => @note }
    end
  end

  private

  def set_claim
    @claim = Claim.find(params[:claim_id])
  end
end
