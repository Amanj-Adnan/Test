class UserWorkflowsController < ApplicationController
    before_action :authorized_admin
    layout('admin' )

    def new
        @users = User.all
        @office = get_office
    end
     
    def create
        @new_workflow= get_office.user_workflows.create!(get_params)
        if @new_workflow.save
            ActiveRecord::Base.transaction do
                params[:user][:email].each do |e|
                    @user = User.find_by(email:e)
                    @user.update!(user_workflow_id:@new_workflow.id )
                end

            rescue ActiveRecord::RecordInvalid
                puts "Oops. We tried to do an invalid operation!"
            end
            redirect_to admin_office_path(:city_id => get_office.city.id)

        else
            flash[:alert] = "tried to do an invalid operation"
            redirect_to admin_office_path(:city_id => get_office.city.id)
        end
        # @new_workflow= get_office.user_workflows.create!(get_params)
        puts(">>>>>>>>>>>>>>>>>>>>>>")
        puts(params[:user][:email])
        puts("<<<<<<<<<<<<<<<<<<<<<<")
    end


    private

    def get_office
        Office.find(params[:office_id])
    end

    def get_params
        params.require(:user).permit(:workflow_name , :workflow_manager)
    end



end
