class Admin::AuthorsController < ApplicationController
  layout 'admin'

  before_action :set_author, only: [:show, :edit, :update, :destroy]
  before_action :get_current_user

  # GET /admin/authors
  # GET /admin/authors.json
  def index
    @authors = Author.all
  end

  # GET /admin/authors/1
  # GET /admin/authors/1.json
  def show
  end

  # GET /admin/authors/new
  def new
    @author = Author.new
  end

  # GET /admin/authors/1/edit
  def edit
  end

  # POST /admin/authors
  # POST /admin/authors.json
  def create
    @author = Author.new(author_params)

    respond_to do |format|
      if @author.save
        format.html { redirect_to [:admin, @author], notice: 'Author was successfully created.' }
        format.json { render :show, status: :created, location: @author }
      else
        format.html { render :new }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/authors/1
  # PATCH/PUT /admin/authors/1.json
  def update
    respond_to do |format|
      if @author.update(author_params)
        format.html { redirect_to [:admin, @author], notice: 'Author was successfully updated.' }
        format.json { render :show, status: :ok, location: @author }
      else
        format.html { render :edit }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/authors/1
  # DELETE /admin/authors/1.json
  def destroy
    @author.destroy
    respond_to do |format|
      format.html { redirect_to admin_authors_url, notice: 'Author was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_author
      @author = Author.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def author_params
      params.require(:author).permit(:name, :account)
    end
end
