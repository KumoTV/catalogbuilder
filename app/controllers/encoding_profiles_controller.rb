class EncodingProfilesController < ApplicationController
  before_action :set_encoding_profile, only: [:show, :edit, :update, :destroy]

  # GET /encoding_profiles
  # GET /encoding_profiles.json
  def index
    @encoding_profiles = EncodingProfile.all
  end

  # GET /encoding_profiles/1
  # GET /encoding_profiles/1.json
  def show
  end

  # GET /encoding_profiles/new
  def new
    @encoding_profile = EncodingProfile.new
  end

  # GET /encoding_profiles/1/edit
  def edit
  end

  # POST /encoding_profiles
  # POST /encoding_profiles.json
  def create
    @encoding_profile = EncodingProfile.new(encoding_profile_params)

    respond_to do |format|
      if @encoding_profile.save
        format.html { redirect_to @encoding_profile, notice: 'Encoding profile was successfully created.' }
        format.json { render :show, status: :created, location: @encoding_profile }
      else
        format.html { render :new }
        format.json { render json: @encoding_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /encoding_profiles/1
  # PATCH/PUT /encoding_profiles/1.json
  def update
    respond_to do |format|
      if @encoding_profile.update(encoding_profile_params)
        format.html { redirect_to @encoding_profile, notice: 'Encoding profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @encoding_profile }
      else
        format.html { render :edit }
        format.json { render json: @encoding_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /encoding_profiles/1
  # DELETE /encoding_profiles/1.json
  def destroy
    @encoding_profile.destroy
    respond_to do |format|
      format.html { redirect_to encoding_profiles_url, notice: 'Encoding profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_encoding_profile
      @encoding_profile = EncodingProfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def encoding_profile_params
      params.require(:encoding_profile).permit(:preset_id, :name, :description)
    end
end
