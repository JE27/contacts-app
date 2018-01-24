class ContactsController < ApplicationController
  def index
    contacts = Contact.all
    render json: contacts.as_json
  end

  def create 
    contacts = Contact.new(
                           first_name: params[:first_name],
                           middle_name: params[:first_name],
                           last_name: params[:last_name],
                           email: params[:phone_number],
                           phone_number: params[:email],
                           bio: params[:bio]
                          )  
    if contacts.save
    render json: contacts.as_json
    else
      render json: {errors: contacts.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    contacts = Contact.find(params[:id])
    render json: contacts.as_json 
  end

  def update
    contacts = Contact.find(params[:id])

    contacts.first_name = params[:first_name] || contacts.first_name
    contacts.middle_name = params[:middle_name] || contacts.middle_name
    contacts.last_name = params[last_name] || contacts.last_name
    contacts.phone_number = params[phone_number] || contacts.phone_number
    contacts.email = params[email] || contacts.email
    contacts.bio = params[bio] || contacts.bio

    if contacts.save
    render json: contacts.as_json
    else
      render json: {errors: contacts.errors.full_messages}, status: :unprocessable_entity
    end
    
  end

  def destroy
    contacts = contacts.find(params[:id])
    contacts.destroy
    # render json: {message: "You've successfully deleted #{{contacts.first_name}} from your life."} 
  end

end
