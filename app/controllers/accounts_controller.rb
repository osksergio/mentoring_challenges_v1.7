class AccountsController < ApplicationController
  before_action :set_account, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token

  # GET /accounts or /accounts.json
  def index
    @accounts = Account.all

    # filter by ID
    #@accounts = Account.where("id = #{params[:id]}") if params[:id]
    @accounts = @accounts.where("id = #{params[:id]}") if params[:id]
    # filter by Number Account
    #@accounts = Account.where("account_number = #{params[:account_number]}") if params[:account_number]
    @accounts = @accounts.where("account_number = #{params[:account_number]}") if params[:account_number]
    # filter by Supplier ID
    #@accounts = Account.where("supplier_id = #{params[:supplier_id]}") if params[:supplier_id]
    @accounts = @accounts.where("supplier_id = #{params[:supplier_id]}") if params[:supplier_id]
  end

  # GET /accounts/1 or /accounts/1.json
  def show
  end

  # GET /accounts/new
  def new
    @account = Account.new
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts or /accounts.json
  def create
    @account = Account.new(account_params)

    respond_to do |format|
      if @account.save
        format.html { redirect_to account_url(@account), notice: "Account was successfully created." }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/1 or /accounts/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to account_url(@account), notice: "Account was successfully updated." }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1 or /accounts/1.json
  def destroy
    id_deleted = params[:id]

    @account.destroy

    respond_to do |format|
      format.html { redirect_to accounts_url, notice: "Account was successfully destroyed." }
      format.json { render json: { first_message: "Account was successfully destroyed.",
                                   second_message: "Account deleted: #{id_deleted}"}, status: :ok }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def account_params
      params.require(:account).permit(:account_number, :supplier_id, :digit)
    end
end
