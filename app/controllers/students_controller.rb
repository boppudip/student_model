class StudentsController < ApplicationController
    skip_before_action :verify_authenticity_token
    #skip_before_filter :verify_authenticity_token

    #respond_to :html, :json
    def index
        @students = Student.paginate(page: params[:page], per_page: 2)
        #respond_with(@students)
        respond_to do |format|
            format.json {render json: {"students": @students}}
            format.html #index.html.erb
        end
    end
    def new
        @student = Student.new
    end
    def create
        @student = Student.new(student_params)
        if @student.save
            HardWorker.perform_at(5.minutes.from_now, @student.name)
            respond_to do |format|
                format.json {render json: {"student": @student}}
                format.html {render :show}
            end
        else
            respond_to do |format|
                format.json {render json: {"Errors": @student.errors.full_messages}}
                format.html {render :new}
            end
        end
    end

    private
    def student_params
        params.require(:student).permit(:name, :address, :email, :phone)
    end
end
