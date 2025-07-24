class RoomsController < ApplicationController
  before_action :set_room, only: %i[show]
  def index
    @rooms = Room.all
  end

  def show
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @membership = Membership.new(room: @room, user: Current.user, role: "owner")

    begin
      ActiveRecord::Base.transaction do
        @room.save!
        @membership.save!
      end

      respond_to do | format |
        format.html { redirect_to @room, notice: "Room successfully created" }
      end

    rescue ActiveRecord::RecordInvalid
      respond_to do | format |
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def room_params
    params.expect room: [ :name ]
  end

  def set_room
    @room = Room.find(params.expect(:id))
  end
end
