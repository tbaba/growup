class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    auths = env['rack.auth']
    if @user = User.find_by_uid(auths['uid'])
      session[:user_id] = @user.uid
      flash[:notice] = "login SUCCESS!!"
      redirect_to :root
    else
      @user = User.new :uid => auths['uid'], :name => auths['user_info']['user_name'], :provider => auths['provider']
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      flash[:notice] = "registration complete!!"
      redirect_to :root
    else
      flash[:notice] = "registration fail..."
      render :auth
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      redirect_to @user, :notice => 'User was successfully updated.'
    else
      render :action => "edit"
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to :root
  end

end
