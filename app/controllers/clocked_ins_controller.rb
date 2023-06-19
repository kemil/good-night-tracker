class ClockedInsController < ApplicationController
  before_action :set_clocked_in, only: %i[ show edit destroy ]
  before_action :set_user_clocked_in, only: %i[ update ]
  protect_from_forgery with: :null_session

  # GET /clocked_ins or /clocked_ins.json
  def index
    @clocked_ins = ClockedIn.from_previous_week
  end

  # GET /clocked_ins/1 or /clocked_ins/1.json
  def show
  end

  # GET /clocked_ins/new
  def new
    @clocked_in = ClockedIn.new
  end

  # GET /clocked_ins/1/edit
  def edit
  end

  # POST /clocked_ins or /clocked_ins.json
  def create
    @clocked_in = ClockedIn.new(clocked_in_params)

    respond_to do |format|
      if @clocked_in.save
        format.html { redirect_to clocked_in_url(@clocked_in), notice: "Clocked in was successfully created." }
        format.json { render :show, status: :created, location: @clocked_in }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @clocked_in.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clocked_ins/1 or /clocked_ins/1.json
  def update
    respond_to do |format|
      unless @clocked_in.nil?
        if @clocked_in.update(clocked_in_params)
          format.html { redirect_to clocked_in_url(@clocked_in ), notice: "Clocked in was successfully updated." }
          format.json { render :show, status: :ok, location: @clocked_in  }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @clocked_in.errors, status: :unprocessable_entity }
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: "Clocked in or user not found.", status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clocked_ins/1 or /clocked_ins/1.json
  def destroy
    @clocked_in.destroy

    respond_to do |format|
      format.html { redirect_to clocked_ins_url, notice: "Clocked in was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clocked_in
      @clocked_in = ClockedIn.find(params[:id])
    end

    def set_user_clocked_in
      @clocked_in = ClockedIn.find_by_id_and_user_id(params[:id], clocked_in_params[:user_id])
    end

    # Only allow a list of trusted parameters through.
    def clocked_in_params
      params.require(:clocked_in).permit(:start_date, :start_date, :user_id)
    end
end
