class DocumentsController < ApplicationController
  def index
    @documents = Document.all
  end

  def show
    @document = Document.find(params[:id])
  end

  def create
    # See document_helpers.rb
    uploader(params[:uploads][:file])

    @document = Document.create(name: params[:uploads][:file].original_filename)

    # http://guides.rubyonrails.org/debugging_rails_applications.html#what-is-the-logger-questionmark
    logger.debug("Uploaded #{@document.name}")
    redirect_to documents_path
  end

  def download
    @document = Document.find(params[:id])

    # http://api.rubyonrails.org/v5.1/classes/ActionController/DataStreaming.html#method-i-send_file
    send_file("public/uploads/#{@document.name}")
  end
end
