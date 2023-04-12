# frozen_string_literal: true

class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chat, only: %i[show edit update destroy]
  before_action :set_message, only: %i[ show edit update destroy extract_keywords
                                        generate_image correct_grammar ]

  # GET /messages/1 or /messages/1.json
  def show; end

  # GET /messages/1/edit
  def edit; end

  def extract_keywords
    keywords_extraction_process = @message.catch_keywords
    if keywords_extraction_process
      redirect_to @message, notice: "Keywords extracted"
    else
      redirect_to @message, notice: "Error extracting keywords"
    end
  end

  def generate_image
    image_generation_process = @message.generate_image
    if image_generation_process
      redirect_to @message, notice: "Image generated"
    else
      redirect_to @message, notice: "Error generating image"
    end
  end

  def correct_grammar
    grammar_correction_process = @message.correct_grammar
    if grammar_correction_process
      redirect_to @message, notice: "Grammar corrected"
    else
      redirect_to @message, notice: "Error correcting grammar"
    end
  end

  def generate_questions
    question_generation_process = @message.generate_questions
    if question_generation_process
      redirect_to @message, notice: "Questions generated"
    else
      redirect_to @message, notice: "Error generating questions"
    end
  end

  # PATCH/PUT /messages/1 or /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: "Message was successfully updated." }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1 or /messages/1.json
  def destroy
    chat = @message.chat
    @message.destroy
    respond_to do |format|
      format.html { redirect_to chat_url(chat), notice: "Message was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_chat
      @chat = Chat.find(params[:chat_id]) if params[:chat_id].present?
    end

    def set_message
      @message = Message.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def message_params
      params.require(:message).permit(:chat_id, :role, :content)
    end
end
