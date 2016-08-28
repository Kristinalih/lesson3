class Station
  attr_reader :name

  def initialize(name)
    @name = name
    @trains = []
  end

  def train_arrive(train)
    @trains << train
    puts "На станции #{name} находится поезд #{train_number}."
  end

  def train_departure(train)
    puts "Со станции #{name} отправлен поезд #{train_number}."
    @trains.delete(train)
  end

  def train_list(type)
   number = 0
   @trains.each do |train|
    if train.type == type
      train_list << train
      number +=1
      end
  end

  if number == 0
    puts "На станции #{name} нет поездов."
  elsif number == 1
    puts "На станции #{name} находится 1 поезд типа #{type}."
   elsif number == 2 || number == 3 || number == 4
    puts "На станции #{name} находится #{number} поезда типа #{type}."
   else
    puts "На станции #{name} находится #{number} поездов типа #{type}."
  end
end 

class Route

  def initialize(first_station, last_station)
    @stations = [first_station, last_station]
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def delete_station(station)
    if station != first_station || station != last_station  
      @stations.delete(station) 
    else
      puts "Эту станцию нельзя удалить."
    end

  def all_stations
    stations.each do |station_name| 
    end
    puts = "Начальная станция - это #{first_station}, конечная станция - это #{last_station}, промежуточные станции: #{station_name}."
  end  
end

class Train
  attr_accessor :speed, :number, :speed, :carrages
  
  def initialize(number, type, carriages)
  
    @number = number
    @type = type
    @carriages = carriages
    @speed = 0
  end
  
  def gain_speed(speed)
    @speed += speed
  end

  def show_speed
    puts "Поезд едет со скоростью #{speed} км/ч."
  end

  def stop
    @speed = 0
  end

  def carriages
    puts "Количество вагонов равно #{carriages}."
  end

  def add_carriage
    if @speed == 0
      @carriages +=1
    else
      puts "Прицепить вагон нельзя."
    end
  end

  def remove_carriage
    if @speed == 0
      @carriages -=0
    else
      puts "Отцепить вагон нельзя."
    end
  end

  def new_route(route)
    @route = route
    @current_station = route.stations.first_station
    @route.get_station(@current_station).train_arrive(self)
  end

  def   go_next_station
    next_station = @route.get_station_index(@current_station)
    @route.get_station(@current_station).train_departure(self)
    @current_station = next_station
    @route.get_station(@current_station).train_arrive(self)
  end

  def go_previous_station
    previous_station = @route.get_previous_station_index(@current_station)
    @route.get_station(@current_station).train_departure(self)
    @current_station = previous_station
    @route.get_station(@current_station).train_arrive(self)
  end

  def show_route
    puts "Маршрут поезда - #{route}."
    puts "Станция, на которой находится поезд, - #{current_station}."
    puts "Станция, куда поедет поезд, - #{next_station}."
    puts "Станция, откуда приехал поезд, - #{previous_station}."
  end

end