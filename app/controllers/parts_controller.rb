class PartsController < ApplicationController
  before_action :set_part, only: %i[ show edit update destroy ]

  # GET /parts or /parts.json
  def index
    @parts = Part.all

    # filter by ID
    @parts = Part.where("id = #{params[:id]}") if params[:id]
    # filter by Description
    @parts = Part.where("description = #{params[:description]}") if params[:description]
    # filter by Part Number
    @parts = Part.where("part_number = #{params[:part_number]}") if params[:part_number]
    # filter by Supplier ID
    @parts = Part.where("supplier_id = #{params[:supplier_id]}") if params[:supplier_id]
  end

  # GET /parts/1 or /parts/1.json
  def show
  end

  # GET /parts/new
  def new
    @part = Part.new
  end

  # GET /parts/1/edit
  def edit
  end

  # POST /parts or /parts.json
  def create
    @part = Part.new(part_params)

    respond_to do |format|
      if @part.save
        format.html { redirect_to part_url(@part), notice: "Part was successfully created." }
        format.json { render :show, status: :created, location: @part }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @part.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parts/1 or /parts/1.json
  def update
    respond_to do |format|
      if @part.update(part_params)
        format.html { redirect_to part_url(@part), notice: "Part was successfully updated." }
        format.json { render :show, status: :ok, location: @part }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @part.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parts/1 or /parts/1.json
  def destroy
    @part.destroy

    respond_to do |format|
      format.html { redirect_to parts_url, notice: "Part was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_part
      @part = Part.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def part_params
      params.require(:part).permit(:description, :part_number, :supplier_id)
    end
end
