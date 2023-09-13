require 'csv'
class HomeController < ApplicationController
    before_action :authenticate_user! 

    def index
    end

    def dashboard
        if current_user
            if current_user.user_type == "admin"
                redirect_to admin_dash_path
            else
                @user = current_user
            end
        else
            redirect_to new_user_session_path
        end
    end

    def admin_dash
    end

    def all_user
        data = User.where.not(user_type: "admin")
        render :json => data
    end

    def user_details
    data = User.find(params[:id])
    render :json => data
    end

    def user_verify
        data = User.user_verify(params[:id])
    end
    def user_delete
        data = User.user_delete(params[:id])
    end

    def user_update
        puts"params==========#{params}"
        data = User.user_update(params)
    end
    def undefined
        render :plain => false
    end
	
	def mass_data_upload

    end    

    def save_mass_data_upload
        name =  params[:upload]['datafile'].original_filename
		directory = "/mnt/d/assesment/"
		 
		name_without_extension,extension= name.split(".")
		@error_msg=""
		if extension =="csv"
				path = File.join(directory, name)# create the file path
				File.open(path, "wb") { |f| f.write( params[:upload]['datafile'].read) }# write the file
                total_count=0
				CSV.foreach(path, headers: true) do |row|

                    begin
                        User.create!(
                        email: row['email'],
                        name: row['name'],
                        dob: row['dob'],
                        address:row['address'],
                        password:"test123456"
                        )
                        total_count +=1
                    rescue
                        
                    end    
                end    
				
				@error_msg="File Processed Successfully"
                if total_count==0
                    @error_msg="Records already exists"
                end    
			
		else
			@error_msg="Format of file is not supported"
		end 
		redirect_to "/mass_data_upload?status=#{@error_msg}"
    end   
end
