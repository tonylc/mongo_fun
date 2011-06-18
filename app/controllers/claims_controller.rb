class ClaimsController < ApplicationController
  # GET /claims
  # GET /claims.xml
  def index
    # TODO does mogoid support includes to avoid n+1 query?
    if params[:search_claims].present?
      @search_result = true
      fuzzy_insensitive_regex = Regexp.new(".*#{params[:search_claims]}.*", Regexp::IGNORECASE)
      # TODO make more efficient...
      # i believe mongodb 1.5.3 supports $or
      # e.g. Claim.where('notes.author_name' => fuzzy_insensitive_regex)
      #              .or('notes.body_text' => fuzzy_insensitive_regex)
      @claims = [Claim.where(:claim_location_postcode => fuzzy_insensitive_regex),
                 Customer.where(:name => fuzzy_insensitive_regex).map(&:claim),
                 Claim.where('notes.author_name' => fuzzy_insensitive_regex),
                 Claim.where('notes.body_text' => fuzzy_insensitive_regex)].flatten.uniq
    else
      @claims = Claim.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @claims }
      format.json { render :json => @claims }
    end
  end

  # GET /claims/1
  # GET /claims/1.xml
  def show
    @claim = Claim.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @claim }
      format.json { render :json => @claim }
    end
  end

  # GET /claims/new
  # GET /claims/new.xml
  def new
    @claim = Claim.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @claim }
    end
  end

  # GET /claims/1/edit
  def edit
    @claim = Claim.find(params[:id])
  end

  # POST /claims
  # POST /claims.xml
  def create
    @claim = Claim.new(params[:claim])

    respond_to do |format|
      if @claim.save
        format.html { redirect_to(@claim, :notice => 'Claim was successfully created.') }
        format.xml  { render :xml => @claim, :status => :created, :location => @claim }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @claim.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /claims/1
  # PUT /claims/1.xml
  def update
    @claim = Claim.find(params[:id])

    respond_to do |format|
      if @claim.update_attributes(params[:claim])
        format.html { redirect_to(@claim, :notice => 'Claim was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @claim.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /claims/1
  # DELETE /claims/1.xml
  def destroy
    @claim = Claim.find(params[:id])
    @claim.destroy

    respond_to do |format|
      format.html { redirect_to(claims_url) }
      format.xml  { head :ok }
    end
  end
end
