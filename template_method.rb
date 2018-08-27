# Splits alg into several steps and running them in specific order. Allows subclasses redefine specific step withou redifining alg structure.

class HouseBuilder
  def build
    add_foundation
    add_walls
    add_roof
  end

  def add_foundation
    puts "Adding default foundation"
  end

  def add_walls
    puts "Adding default walls"
  end

  def add_roof
    puts "Adding default roof"
  end
end

class WoodenHouseBuilder < HouseBuilder
  def add_walls
    puts "Adding wooden walls"
  end

  def add_roof
    puts "Adding wooden roof"
  end
end


class GlassHouseBuilder < HouseBuilder
  def add_walls
    puts "Adding glass walls"
  end

  def add_roof
    puts "Adding glass roof"
  end
end


wooden_house = WoodenHouseBuilder.new
wooden_house.build

glass_house = GlassHouseBuilder.new
glass_house.build
