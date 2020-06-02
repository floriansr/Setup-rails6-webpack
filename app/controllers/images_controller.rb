class ImagesController < ApplicationController
  before_action :set_image, only: %i[show edit update destroy]
  before_action :private_route, except: [:index]
  before_action :define_current_user, except: [:index]


  def index
    @images = Image.all
  end

  def show
    @user = User.find(@image.author_id).username
  end

  def new
    @image = Image.new
  end

  def edit
  end

  def create
    permit_image_params
    @image = Image.new(
      author: @user,
      description: @description,
      stream: Base64.strict_encode64(File.open(@image_stream.tempfile).read),
      extension: @extension
    )

    respond_to do |format|
      if @image.save
        format.html { redirect_to @image, notice: 'Image was successfully created.' }
        format.json { render :show, status: :created, location: @image }
      else
        format.html { render :new }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    permit_image_params
    respond_to do |format|
      if @image.update(
      author: @user,
      description: @description,
      stream: Base64.strict_encode64(File.open(@image_stream.tempfile).read),
      extension: @extension
      )
        format.html { redirect_to @image, notice: 'Image was successfully updated.' }
        format.json { render :show, status: :ok, location: @image }
      else
        format.html { render :edit }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @image.destroy
    respond_to do |format|
      format.html { redirect_to images_url, notice: 'Image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_image
      @image = Image.find(params[:id])
    end

    def define_current_user
      @user = current_user
    end

    def permit_image_params
      @image_stream = params.require(:image).permit(:stream)[:stream]
      @extension = @image_stream.original_filename.split(".")[-1]
      @description = params.require(:image).permit(:description)[:description]
    end

end
