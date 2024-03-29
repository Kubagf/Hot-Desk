class DesksController < ApplicationController
  before_action :set_desk, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /desks or /desks.json
  def index
    @desks = Desk.all
  end

  # GET /desks/1 or /desks/1.json
  def show
  end

  # GET /desks/new
  def new
    @desk = Desk.new
  end

  # GET /desks/1/edit
  def edit
  end

  # POST /desks or /desks.json
  def create
    @desk = Desk.new(desk_params)

    respond_to do |format|
      if @desk.save
        format.html { redirect_to desks_url, notice: "Desk was successfully created." }
        format.json { render :show, status: :created, location: @desk }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @desk.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /desks/1 or /desks/1.json
  def update
    respond_to do |format|
      if @desk.update(desk_params)
        format.html { redirect_to desks_url, notice: "Desk was successfully updated." }
        format.json { render :show, status: :ok, location: @desk }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @desk.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /desks/1 or /desks/1.json
  def destroy
    @desk.destroy!

    respond_to do |format|
      format.html { redirect_to desks_url, notice: "Desk was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def check_availability
    desk_id = params[:desk_id]
    date = params[:date]

    if desk_id.present? && date.present?
      desk = Desk.find(desk_id)
      date = Date.parse(date)

      if desk.available?(date)
        if desk.reservations.where('start_date <= ? AND end_date >= ?', date, date).empty?
          flash[:notice] = "Desk is available on #{date}."
        else
          flash[:alert] = "Desk is already reserved on #{date}."
        end
      else
        flash[:alert] = "Desk is not available on #{date}."
      end
    else
      flash[:alert] = "Please select a desk and a date."
    end
    redirect_to desks_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_desk
      @desk = Desk.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def desk_params
      params.require(:desk).permit(:description, :available, :photo)
    end
    def authenticate_user!
      redirect_to root_path unless user_signed_in?
    end
end
