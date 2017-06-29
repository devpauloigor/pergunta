require 'users/registrations_controller'
require 'user'
class RegistrosController <  Devise::RegistrationsController
 before_filter :configure_permitted_parameters
 before_filter :authenticate_user!


  protected

 def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  

  def configure_permitted_parameters
  
    devise_parameter_sanitizer.for(:sign_up).push(:email, :perfil, :nome)
    

 
  end

def registros
  @usuarior = User.new
  nome=params[:nome]
    email=params[:email]
    perfil=params[:perfil]
    password=params[:password]
    password_confirmation=params[:password_confirmation]


end
  

  



def cadregistro
    
    

    nome=params[:nome]
    email=params[:email]
    perfil=params[:perfil]
    password=params[:password]
    password_confirmation=params[:password_confirmation]

    @usuario = User.new
    @usuario.nome = nome
    @usuario.email = email
    @usuario.perfil = perfil
    @usuario.password = password
    @usuario.password_confirmation = password_confirmation    
  

     @usuario.save

     respond_to do |format|
      format.js

    end

  end

   def set_user
      @user = User.find(params[:id])
    end

def user_params
    params.require(:user).permit(:nome, :email, :perfil, :password, :password_confirmation)
   
   end

# Virtual attribute for authenticating by either username or email
# This is in addition to a real persisted field like 'username'

  
end