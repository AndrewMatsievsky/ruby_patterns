# Singleton pattern: ensure that only one instance of class is created
# Provide global point to it
class Chosen
  @@one = nil
  def self.one
    @@one ||= new
  end  
  
  def create(name)
    @name = name
  end

  def get_name
    @name
  end

  private_class_method :new
end

wanderer = Chosen.one
wanderer.create('Wasteland Dweller')

raider = Chosen.one


puts raider == wanderer
puts raider.get_name
puts wanderer.get_name

