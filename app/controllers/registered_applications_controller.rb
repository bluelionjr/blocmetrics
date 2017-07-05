class RegisteredApplicationsController < ApplicationController
  def index
    @registered_applications = RegisteredApplication.all
  end

  def show
    @registered_application = RegisteredApplication.find(params[:id])
    @events = @registered_application.events.group_by(&:name)
  end

  def new
    @registered_application = RegisteredApplication.new
  end

  def create
    @registered_application = RegisteredApplication.new
    @registered_application.title = params[:registered_application][:title]
    @registered_application.url = params[:registered_application][:url]
    @registered_application.user_id = current_user.id

    if @registered_application.save
      flash[:notice] = "Registered application was saved."
      redirect_to @registered_application
    else
      flash.now[:alert] = "There was an error saving the registered application. Please try again."
      render :new
    end
  end

  def edit
    @registered_application = RegisteredApplication.find(params[:id])
  end

  def update
    @registered_application = RegisteredApplication.find(params[:id])
    @registered_application.title = params[:registered_application][:title]
    @registered_application.url = params[:registered_application][:url]

    if @registered_application.save
      flash[:notice] = "Registered application was updated."
      redirect_to @registered_application
    else
      flash.now[:alert] = "There was an error saving the application. Please try again."
      render :edit
    end
  end

  def destroy
    @registered_application = RegisteredApplication.find(params[:id])

    if @registered_application.destroy
      flash[:notice] = "\"#{@registered_application.title}\" was deleted successfully."
      redirect_to registered_applications_path
    else
      flash.now[:alert] = "There was an error deleting the application."
      render :show
    end
  end
end
