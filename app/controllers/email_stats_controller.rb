class EmailStatsController < ApplicationController
  # GET /email_stats
  # GET /email_stats.json
  def index
    @email_stats = EmailStat.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @email_stats }
    end
  end

  # GET /email_stats/1
  # GET /email_stats/1.json
  def show
    @email_stat = EmailStat.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @email_stat }
    end
  end

  # GET /email_stats/new
  # GET /email_stats/new.json
  def new
    @email_stat = EmailStat.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @email_stat }
    end
  end

  # GET /email_stats/1/edit
  def edit
    @email_stat = EmailStat.find(params[:id])
  end

  # POST /email_stats
  # POST /email_stats.json
  def create
    @email_stat = EmailStat.new(params[:email_stat])

    respond_to do |format|
      if @email_stat.save
        format.html { redirect_to @email_stat, notice: 'Email stat was successfully created.' }
        format.json { render json: @email_stat, status: :created, location: @email_stat }
      else
        format.html { render action: "new" }
        format.json { render json: @email_stat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /email_stats/1
  # PUT /email_stats/1.json
  def update
    @email_stat = EmailStat.find(params[:id])

    respond_to do |format|
      if @email_stat.update_attributes(params[:email_stat])
        format.html { redirect_to @email_stat, notice: 'Email stat was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @email_stat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /email_stats/1
  # DELETE /email_stats/1.json
  def destroy
    @email_stat = EmailStat.find(params[:id])
    @email_stat.destroy

    respond_to do |format|
      format.html { redirect_to email_stats_url }
      format.json { head :ok }
    end
  end
end
