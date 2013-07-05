class DataFile < ActiveRecord::Base
  def self.save(upload)
    name =  upload['datafile'].original_filename
    directory = "upload/public/data"
    # create the file path
    path = File.join(directory, name)
    # write the file
    File.open(path, "wb") { |f| f.write(upload['datafile'].read) }
#    value=`pwd`
    command_load_file="./script/carga_caca.sh #{path}"
    logger.debug "command 2 load #{command_load_file}"
    load_result=`#{command_load_file} 2>&1`
    logger.debug "the result of loading #{}"
  end
end