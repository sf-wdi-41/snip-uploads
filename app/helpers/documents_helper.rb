module DocumentsHelper
  def uploader(file_io)
    # Uploads will usually be of ruby class StringIO
    File.open(Rails.root.join('public', 'uploads', file_io.original_filename), 'wb') do |file|
      file.write(file_io.read)
    end
  end
end
