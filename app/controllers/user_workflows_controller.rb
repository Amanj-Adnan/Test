class UserWorkflowsController < ApplicationController
    before_action :authorized_admin
    before_action :set_workflow_prams, only: [:edit,:update]
    layout('admin' )

    def new
        @users = User.all
        @office = get_office
        @user_workflows = UserWorkflow.all
    end
     
    def create
        puts(params)
        @office = Office.find(params[:office_id])
        @hr_officer = @office.hr_officer
        puts(@hr_officer.email)
        puts(params)
        @new_workflow= get_office.user_workflows.create!(get_params)
        if @new_workflow.save
            ActiveRecord::Base.transaction do
                params[:user][:employees].each do |id|
                    if id != ''
                        puts(id)
                    @user = User.find_by(id:id)
                    @user.update!(user_workflow_id:@new_workflow.id )
                    @user_profile = UserProfile.find_by(user_id:id)
                    @user_profile.update!(working_office:params[:office_id] , line_manager: params[:user][:workflow_manager] )
                    end
                end

            rescue ActiveRecord::RecordInvalid
                puts "Oops. We tried to do an invalid operation!"
            end
            redirect_to admin_office_path(:city_id => get_office.city.id)

        else
            flash[:alert] = "tried to do an invalid operation"
            redirect_to admin_office_path(:city_id => get_office.city.id)
        end
    end

    def edit
        @users = User.all
        @current_users = @workflow.users.ids.to_a
        @line_manager=User.find_by(id:@workflow.workflow_manager).id
        @office = Office.first
    end

    def update

        if @workflow.update(get_params)

            redirect_to root_path

        else
            render :edit
        end
    end


    private

    def get_office
        Office.find(params[:office_id])
    end

    def get_params
        params.require(:user).permit(:workflow_name , :workflow_manager)
    end

    def set_workflow_prams
        @workflow = UserWorkflow.find_by(id: params[:workflow_id])
    end



end
