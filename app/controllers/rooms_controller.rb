require_relative '../views/rooms_view'

class RoomsController
  def initialize(room_repository)
    @room_repository = room_repository
    @view = RoomsView.new
  end

  def create
    number = @view.ask_number
    capacity = @view.ask_capacity
    room = Room.new(number: number, capacity: capacity)
    @room_repository.add(room)
  end

  def list
    rooms = @room_repository.all
    @view.list(rooms)
  end
end