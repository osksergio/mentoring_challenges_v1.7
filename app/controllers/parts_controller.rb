class PartsController < ApplicationController
  before_action :set_part, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token

  # GET /parts or /parts.json
  def index
    @parts = Part.all
    @parts = @parts.where("id = #{params[:id]}") if params[:id]
    @parts = @parts.where("description = #{params[:description]}") if params[:description]
    @parts = @parts.where("part_number = #{params[:part_number]}") if params[:part_number]
    @parts = @parts.where("supplier_id = #{params[:supplier_id]}") if params[:supplier_id]
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
    id_deleted = params[:id]

    @part.destroy

    respond_to do |format|
      format.html { redirect_to parts_url, notice: "Part was successfully destroyed." }
      format.json { render json: { first_message: "Part was successfully destroyed.",
                                   second_message: "Part deleted: id #{id_deleted}"}, status: :ok }
    end
  end

  private

    def set_part
      @part = Part.find(params[:id])
    end

    def part_params
      params.require(:part).permit(:description, :part_number, :supplier_id, :price)
    end
end
