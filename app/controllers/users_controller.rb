class UsersController < ApplicationController
  def login
    @idm = 0
    @pwm = 0
    @id = params[:user]
    @password = params[:pass]
    if @password.present? && @id.present?
      if @id.match (/^(?=.*[A-Za-z])[A-Za-z]{1,10}$/)
        flash.now[:error] = "Your id is accepted"
        @idm = 1
        cookies[:user] = @id
      elsif
        flash.now[:error] = "Please enter a valid ID"
      end
      if @password.match (/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/)
        flash.now[:error1] = "Your password is accepted"
        @pwm = 1
      elsif
        flash.now[:error1] = "Please enter a valid password"
      end
      if @pwm == 1 && @idm == 1
        redirect_to "/users/register"
      end
    end
  end

  def index
    @user = User.new
    @user.full_name = params[:full_name]
    @user.email = params[:email]
    @user.address = params[:address]
    @user.city = params[:city]
    @user.state = params[:state]
    @user.country = params[:country]
    @user.user = params[:user]
    @user.pass = params[:pass]
    @phone = Phone.new
    @phone.hphone = params[:hphone]
    @phone.cphone = params[:cphone]
    @phone.wphone = params[:wphone]
    if @user != nil && @phone != nil
      @user.save
      @phone.save
    end
    # @user.phones << @phone
    if cookies[:user] = @user.user
      @user.save
      redirect_to "/users/login"
    #   render plain: 'Thank you #{@user.name}. You have successfully registered!'
    else
      flash.now[:error3] = "Please Register"
    end
    #
    # cookies[:full_name] = params[:full_name]
    #     @full_name = cookies[:full_name]
    # cookies[:street] = params[:street]
    #     @street = cookies[:street]
    # cookies[:city] = params[:city]
    #     @city = cookies[:city]
    # cookies[:state] = params[:state]
    #     @state = cookies[:state]
    # cookies[:zip] = params[:zip]
    #     @zip = cookies[:zip]
    # cookies[:country] = params[:country]
    #     @country = cookies[:country]
    # cookies[:email] = params[:email]
    #     @email = cookies[:email]
    # cookies[:user] = params[:user]
    #     @user = cookies[:user]
    # cookies[:pass] = params[:pass]
    #     @pass = cookies[:pass]
    # if params.has_key?(:full_name) && !params[:full_name].strip.empty?
    #           redirect_to "/users/login"
    # else
    #   flash[:error] = "Please enter a name to continue!"
    # end


  end

  def register
    @user = User.new
    @user.full_name = params[:full_name]
    @user.email = params[:email]
    @user.address = params[:address]
    @user.city = params[:city]
    @user.state = params[:state]
    @user.country = params[:country]
    @user.user = params[:user]
    @user.pass = params[:pass]
    @phone = Phone.new
    @phone.hphone = params[:hphone]
    @phone.cphone = params[:cphone]
    @phone.wphone = params[:wphone]
    if @user != nil && @phone != nil
      @user.save
      @phone.save
    end
  end

end
