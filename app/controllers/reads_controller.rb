# frozen_string_literal: true

# ReadsController
class ReadsController < ApplicationController
  def create
    file = reads_params[:file]
    extension = File.extname(file.original_filename)

    return render json: { error: 'Only PDF files can be uploaded' }, status: 400 if extension != '.pdf'

    render json: Reader.get_text_from_file(file)
  end

  private

  def reads_params
    params.permit(:file)
  end
end
