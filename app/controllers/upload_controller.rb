#http://www.tutorialspoint.com/ruby-on-rails/rails-file-uploading.htm
class UploadController < ApplicationController
  def index
     render :file => 'app/views/upload/uploadfile.rhtml'
  end
  def uploadFile
    post = DataFile.save(params[:upload],params[:carga_a_egresos]=="true")
    render :text => "File has been uploaded successfully"
  end
end
