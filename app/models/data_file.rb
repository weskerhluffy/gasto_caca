class DataFile < ActiveRecord::Base
  def self.save(upload,carga_a_egresos=true)
    name =  upload['datafile'].original_filename
    directory = "upload/public/data"
    # create the file path
    path = File.join(directory, name)
    # write the file
    File.open(path, "wb") { |f| f.write(upload['datafile'].read) }
#    value=`pwd`
    if(carga_a_egresos)
      command_load_file="./script/carga_caca.sh #{path}"
    else
      command_load_file="./script/carga_mierda_deuda.sh #{path}"
    end
    logger.debug "command 2 load #{command_load_file}"
    load_result=`#{command_load_file} 2>&1`
    logger.debug "the result of loading #{load_result}"
  end
end