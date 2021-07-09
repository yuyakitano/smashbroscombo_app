class Admin::ContactsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @contacts = Contact.all
  end
  def show
    @contact = Contact.find(params[:id])
    
  end
  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    #非同期処理の場合
    redirect_to admin_contacts_url, notice: "お問い合わせメッセージID「#{@contact.id}」を削除しました"
  end

  private


end