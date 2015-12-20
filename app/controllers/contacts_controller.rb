class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  #before_action :authenticate_user!, only: [:index, :edit, :update, :destroy]
  http_basic_authenticate_with name: "admin", password: "gmrind", only: [:edit, :update, :destroy]

  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = Contact.all
    @title = 'All Contact |'
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
    @submitted = params["commit"]
    @title = @contact.contact_sub  
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
    @title = ' Contact |'
  end

  # GET /contacts/1/edit
  def edit
    @title = 'Edit Contact |'
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save

        ContactMailer.contact_confirmation(@contact).deliver
        ContactMailer.contact_backemail(@contact).deliver

        format.html { redirect_to @contact, notice: 'Thank you very much. Your message has been sent and you will receive a message confirmation email.' }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    @title = 'Update Contact |'
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:name, :email, :question, :contact_sub)
    end
end
