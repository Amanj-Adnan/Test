class AttendanceController < ApplicationController
  before_action :authorized_admin
  layout('admin' )


end
