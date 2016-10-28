class ParticipationTokensController < ApplicationController
  before_action :set_participation_token, only: [:show, :edit, :update, :destroy]

  # GET /participation_tokens
  # GET /participation_tokens.json
  def index
    @participation_tokens = ParticipationToken.all
  end

  # GET /participation_tokens/1
  # GET /participation_tokens/1.json
  def show
  end

  # GET /participation_tokens/new
  def new
    @participation_token = ParticipationToken.new
  end

  # GET /participation_tokens/1/edit
  def edit
  end

  # POST /participation_tokens
  # POST /participation_tokens.json
  def create
    @participation_token = ParticipationToken.new(participation_token_params)

    respond_to do |format|
      if @participation_token.save
        format.html { redirect_to @participation_token, notice: 'Participation token was successfully created.' }
        format.json { render :show, status: :created, location: @participation_token }
      else
        format.html { render :new }
        format.json { render json: @participation_token.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /participation_tokens/1
  # PATCH/PUT /participation_tokens/1.json
  def update
    respond_to do |format|
      if @participation_token.update(participation_token_params)
        format.html { redirect_to @participation_token, notice: 'Participation token was successfully updated.' }
        format.json { render :show, status: :ok, location: @participation_token }
      else
        format.html { render :edit }
        format.json { render json: @participation_token.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /participation_tokens/1
  # DELETE /participation_tokens/1.json
  def destroy
    @participation_token.destroy
    respond_to do |format|
      format.html { redirect_to participation_tokens_url, notice: 'Participation token was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_participation_token
      @participation_token = ParticipationToken.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def participation_token_params
      params.require(:participation_token).permit(:hash, :poll_id)
    end
end
