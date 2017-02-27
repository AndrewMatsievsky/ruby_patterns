# Defines a one-to-many dependency between objects so that
# when one object changes state, all its dependents are notified and updated automatically.

module Subject
  def initialize
    @observers = []
  end

  def add_observer(observer)
    @observers << observer
  end

  def delete_observer(observer)
    @observers.delete(observer)
  end

  def notify_observers
    @observers.each do |observer|
      observer.update(self)
    end
  end
end

class Person
  attr_accessor :name, :location
  include Subject

  def initialize(name, location)
    super()
    @name, @location = name, location
  end

  def location=(new_location)
    @location = new_location
    notify_observers
  end
end

class FBI
  def update(person)
    puts "FBI report:#{person.name} has changed location to: #{person.location}"
  end
end

class Police
  def update(person)
    puts "Police report:#{person.name} has changed location to: #{person.location}"
  end
end

geralt = Person.new('Geralt of Rivia', 'Kaer Morhen')

fbi_observer = FBI.new
police_observer = Police.new

geralt.add_observer fbi_observer
geralt.add_observer police_observer

geralt.location = 'Vengerberg'
