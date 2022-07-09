require 'rails_helper'

RSpec.describe 'Reads', type: :request do
  describe 'POST /reads' do
    context 'when upload a file' do
      it 'should return a JSON structure if is pdf' do
        file = fixture_file_upload('sample.pdf', 'application/pdf')
        post reads_path, params: { file: file }
        expect(response).to have_http_status(200)
      end

      it 'should return an error if is not pdf' do
        file = fixture_file_upload('sample.txt', 'text/plain')
        post reads_path, params: { file: file }
        expect(response).to have_http_status(400)
      end
    end
  end
end
