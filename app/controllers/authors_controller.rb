class AuthorsController < ApplicationController
  before_action :set_author, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token

  # GET /authors or /authors.json
  def index
    @authors = Author.all
    @authors = @authors.where("id = #{params[:id]}") if params[:id]
    @authors = @authors.where("description = #{params[:description]}") if params[:description]
  end

  # GET /authors/1 or /authors/1.json
  def show
    @books = Book.where("author_id = #{params[:id]}") if params[:id]
  end

  # GET /authors/new
  def new
    @author = Author.new
  end

  # GET /authors/1/edit
  def edit
  end

  # POST /authors or /authors.json
  def create
    @author = Author.new(author_params)

    respond_to do |format|
      if @author.save
        format.html { redirect_to author_url(@author), notice: "Author was successfully created." }
        format.json { render :show, status: :created, location: @author }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /authors/1 or /authors/1.json
  def update
    respond_to do |format|
      if @author.update(author_params)
        format.html { redirect_to author_url(@author), notice: "Author was successfully updated." }
        format.json { render :show, status: :ok, location: @author }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /authors/1 or /authors/1.json
  def destroy
    id_deleted = params[:id]

    @author.destroy

    respond_to do |format|
      format.html { redirect_to authors_url, notice: "Author was successfully destroyed." }
      format.json { render json: { message: "Author was successfully destroyed.",
                                   message_id: "Author deleted: #{id_deleted}" }, status: :ok }
    end
  end

  private

    def set_author
      @author = Author.find(params[:id])
    end

    def author_params
      params.require(:author).permit(:description, :cpf)
    end
end
