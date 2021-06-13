class PasswordsController < ApplicationController
  before_action :set_password, only: [:show, :update, :destroy]

  # GET /passwords
  def index
    @passwords = Password.all

    render json: @passwords
  end

  # GET /passwords/1
  def show
    render json: @password
  end

  # POST /passwords
  def create
    @password = Password.new(password_params)

    if @password.save
      render json: @password, status: :created, location: @password
    else
      render json: @password.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /passwords/1
  def update
    if @password.update(password_params)
      render json: @password
    else
      render json: @password.errors, status: :unprocessable_entity
    end
  end

  # DELETE /passwords/1
  def destroy
    @password.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_password
      @password = Password.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def password_params
      params.require(:password).permit(:password, :isvalid?)
    end
end
