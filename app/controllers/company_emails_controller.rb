class CompanyEmailsController < ApplicationController
  # GET /company_emails
  # GET /company_emails.json
  def index
    @company_emails = CompanyEmail.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @company_emails }
    end
  end

  # GET /company_emails/1
  # GET /company_emails/1.json
  def show
    @company_email = CompanyEmail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @company_email }
    end
  end

  # GET /company_emails/new
  # GET /company_emails/new.json
  def new
    @company_email = CompanyEmail.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @company_email }
    end
  end

  # GET /company_emails/1/edit
  def edit
    @company_email = CompanyEmail.find(params[:id])
  end

  # POST /company_emails
  # POST /company_emails.json
  def create
    @company_email = CompanyEmail.new(params[:company_email])

    respond_to do |format|
      if @company_email.save
        format.html { redirect_to @company_email, notice: 'Company email was successfully created.' }
        format.json { render json: @company_email, status: :created, location: @company_email }
      else
        format.html { render action: "new" }
        format.json { render json: @company_email.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /company_emails/1
  # PUT /company_emails/1.json
  def update
    @company_email = CompanyEmail.find(params[:id])

    respond_to do |format|
      if @company_email.update_attributes(params[:company_email])
        format.html { redirect_to @company_email, notice: 'Company email was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @company_email.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /company_emails/1
  # DELETE /company_emails/1.json
  def destroy
    @company_email = CompanyEmail.find(params[:id])
    @company_email.destroy

    respond_to do |format|
      format.html { redirect_to company_emails_url }
      format.json { head :ok }
    end
  end
end
