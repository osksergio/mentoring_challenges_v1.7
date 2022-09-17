class SuppliersController < ApplicationController
  before_action :set_supplier, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token

  # GET /suppliers or /suppliers.json
  def index
    @suppliers = Supplier.by_supplier_name(params[:search]) if (params[:search]) and (params[:search_type] == 'name')
    @suppliers = Supplier.by_account_number(params[:search]) if (params[:search]) and (params[:search_type] == 'account')
    @suppliers = Supplier.all unless params[:search]
  end

  # GET /suppliers/1 or /suppliers/1.json
  def show
  end

  # GET /suppliers/new
  def new
    @supplier = Supplier.new
  end

  # GET /suppliers/1/edit
  def edit
  end

  # POST /suppliers or /suppliers.json
  def create
    @supplier = Supplier.new(supplier_params)

    respond_to do |format|
      if @supplier.save
        format.html { redirect_to supplier_url(@supplier), notice: "Supplier was successfully created." }
        format.json { render :show, status: :created, location: @supplier }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /suppliers/1 or /suppliers/1.json
  def update
    respond_to do |format|
      if @supplier.update(supplier_params)
        format.html { redirect_to supplier_url(@supplier), notice: "Supplier was successfully updated." }
        format.json { render :show, status: :ok, location: @supplier }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /suppliers/1 or /suppliers/1.json
  def destroy
    id_deleted = params[:id]

    @supplier.destroy

    respond_to do |format|
      format.html { redirect_to suppliers_url, notice: "Supplier was successfully destroyed." }
      format.json { render json: { first_message: "Supplier was successfully destroyed",
                                   second_message: "Supplier deleted: id #{id_deleted}"}, status: :ok }
    end
  end

  private

    def set_supplier
      @supplier = Supplier.find(params[:id])
    end

    def supplier_params
      params.require(:supplier).permit(:description, :cnpj)
    end
end
