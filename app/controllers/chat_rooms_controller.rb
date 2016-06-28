class ChatRoomsController < ApplicationController

  before_action :authenticate_user!, only: [ :new, :create ]

  def index
    @chat_rooms = ChatRoom.paginate(page: params[:page])
  end

  def show
    @chat_room = ChatRoom.includes(:messages).find_by(id: params[:id])
    @message =Message.new
  end

  def new
    @chat_room = ChatRoom.new
  end

  def create
    @chat_room = current_user.chat_rooms.build(chat_room_params)
    if @chat_room.save
      flash[:success] = 'Chat room build successfully~'
      redirect_to chat_rooms_path
    else
      flash[:error] = 'Some error(s) happened!'
      render 'new'
    end
  end

  private

  def chat_room_params
    params.require(:chat_room).permit(:title)
  end
end
