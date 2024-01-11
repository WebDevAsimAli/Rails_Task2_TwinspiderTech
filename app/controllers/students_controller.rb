class StudentsController < ApplicationController
  before_action :set_student, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]
  # GET /students or /students.json
  def index
    @students = Student.all.includes(:user)  # Include user association for efficiency
  end

  # GET /students/1 or /students/1.json
  def show
  end

  # GET /students/new
  def new
    # @student = Student.new
    @student = current_user.students.build
  end

  # GET /students/1/edit
  def edit

  end

  # POST /students or /students.json
  def create
    # @student = Student.new(student_params)

    @student = current_user.students.build(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to student_url(@student), notice: "Student was successfully created." }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1 or /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to student_url(@student), notice: "Student was successfully updated." }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1 or /students/1.json
  def destroy
    @student.destroy!

    respond_to do |format|
      format.html { redirect_to students_url, notice: "Student was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @student = current_user.students.find_by(id: params[:id]) 
    redirect_to student_path, notice: "Not authorized to edit this student" if @student.nil?  # Correct nil check
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_params
      params.require(:student).permit(:name, :email, :age, :major, :gpa, :year_of_graduation, :address, :phone_number, :user_id)
    end
end
