class UserWorkflowsController < ApplicationController
    before_action :authorized_admin
    layout('admin' )
    def new
        @users = User.all
    end
     
    def create
        puts(">>>>>>>>>>>>>>>>>>>>>>")
        puts(params)
        puts("<<<<<<<<<<<<<<<<<<<<<<")
    end


    private

    def self.search
        
    end
    
end
