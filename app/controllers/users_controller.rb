class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/query/%query%.json
  def query
    #display_name_filter = Net::LDAP::Filter.eq('displayName', "*#{params[:displayName]}*")
    #valid_user_filter = Net::LDAP::Filter.construct("(objectCategory=Person)(!(userAccountControl:1.2.840.113556.1.4.803:=2)))")
    #filter = display_name_filter & (valid_user_filter)
    
    filter = Net::LDAP::Filter.construct("(&(displayName=#{params[:displayName]}*)(objectCategory=Person)(!(userAccountControl:1.2.840.113556.1.4.803:=2)))")
    
    @users = User.find_all(:filter => filter, :attributes => ['displayname','telephonenumber','mail'])
    @user_attributes = Array.new
    
    @users.each do |user|
      @user_attributes << {:displayName => user.displayname, :mail => user["mail"], :telephoneNumber => user["telephonenumber"]}
    end
    
#    puts @offices.inspect
    render json: @user_attributes
  end


  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params[:user]
    end
end
