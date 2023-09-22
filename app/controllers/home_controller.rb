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
        user = User.includes(:avatar_attachment).where.not(user_type: "admin").map do |user|{
            id: user.id,
            name: user.name,
            email: user.email,
            dob: user.dob,
            address: user.address,
            varified_by_admin: user.varified_by_admin,
            avatar_url: user.avatar.attachment ? url_for(user.avatar) : "https://t4.ftcdn.net/jpg/02/29/75/83/360_F_229758328_7x8jwCwjtBMmC6rgFzLFhZoEpLobB6L8.jpg"
        }
        end
        render :json => user
    end

    def user_details
    data = User.find(params[:id])
    render :json => data
    end

    def user_verify
        data = User.user_verify(params)
    end
    def user_delete
        data = User.user_delete(params[:ids])
    end

    def user_add_and_update
        data = User.user_add_and_update(params)
    end
    	
    def save_mass_data_upload
        csv_file =  params[:csv_file]	 
		file_extention = File.extname(csv_file.original_filename)
		@error_msg=""
		if file_extention ==".csv"
            total_count=0
            # directory = "/mnt/d/assesment/user_registration_system/public/uploads"
            directory = File.join(Rails.root, 'public', 'uploads')
            if !(File.directory? directory) 
               FileUtils.mkdir_p directory, :mode => 0777 rescue nil
            end
            time = Time.now().strftime("%m_%d_%Y_%I_%M_%S%p")
            file_name = csv_file.original_filename.gsub(file_extention, "_").gsub(" ", "_")
            target_file_name = "#{file_name}_#{time}#{file_extention}"
            target_file_name_path="#{directory}/#{target_file_name}"
            FileUtils.move csv_file.path, target_file_name_path
            File.open(target_file_name_path, "wb") { |f| f.write( csv_file.read) }
            CSV.foreach(target_file_name_path, headers: true) do |row|
                begin
                    user = User.find_by(email: row['email'])
                    if user.nil?
                        password = row['dob'].to_s.strip.gsub("-", "")
                        user = User.create!(
                        email: row['email'],
                        name: row['name'],
                        dob: row['dob'],
                        address: row['address'],
                        password: password
                        )
                        UserMailer.welcome_email(user, password).deliver
                        total_count +=1
                    end
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
        render plain: @error_msg
    end   
      
end
