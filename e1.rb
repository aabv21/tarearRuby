class Circulo
  # Constructor
  def initialize radio
    if radio <= 0
      raise 'Radio Invalido'
    else
      @radio = radio
    end
  end
  # Set radio
  def set_radio radio
    @radio = radio
  end
  # Get radio
  def get_radio
    return @radio
  end
  # Area del circulo
  def area
    return 3.14 * (@radio**2)
  end
end

class Cilindro < Circulo
  # Constructor
  def initialize radio, altura
    super radio
    if altura <= 0
      raise 'Altura Invalido'
    else
      @altura = altura
    end
  end
  # Set altura
  def set_altura altura
    @altura = altura
  end
  def get_altura
    return @altura
  end
  # Volumen del cilindro
  def volumen
    return 3.14*(@radio**2)*@altura
  end
end

# Probando
c1 = Circulo.new 5
c2 = Circulo.new 2.5
cl1 = Cilindro.new 3, 4
cl2 = Cilindro.new 2.5, 3.5

#Probando los gets circulos
temp = c1.get_radio
puts "El valor del radio del circulo 1 es: "+temp.to_s
temp = c2.get_radio
puts "El valor del radio del circulo 2 es: "+temp.to_s

# Calculamos el area
temp = c1.area
puts "El valor del area del circulo 1 es: "+temp.to_s
temp = c2.area
puts "El valor del area del circulo 2 es: "+temp.to_s

# Probando los sets circulos
c1.set_radio 7
c2.set_radio 3.4

temp = c1.get_radio
puts "El valor del radio del circulo 1 es: "+temp.to_s
temp = c2.get_radio
puts "El valor del radio del circulo 2 es: "+temp.to_s

# Calculamos el area otra vez
temp = c1.area
puts "El valor del area del circulo 1 es: "+temp.to_s
temp = c2.area
puts "El valor del area del circulo 2 es: "+temp.to_s

#Probando los gets cilindro
temp = cl1.get_radio
puts "El valor del radio del cilindro 1 es: "+temp.to_s
temp = cl2.get_radio
puts "El valor del radio del cilindro 2 es: "+temp.to_s

temp = cl1.get_altura
puts "El valor de la altura del cilindro 1 es: "+temp.to_s
temp = cl2.get_altura
puts "El valor de la altura del cilindro 2 es: "+temp.to_s

# Calculamos el volumen
temp = cl1.volumen
puts "El valor del volumen del cilindro 1 es: "+temp.to_s
temp = cl2.volumen
puts "El valor del volumen del cilindro 2 es: "+temp.to_s

# Probando los sets circulos
cl1.set_altura 3
cl2.set_altura 2.1
cl1.set_radio 5
cl2.set_radio 5.6

temp = cl1.get_radio
puts "El valor del radio del cilindro 1 es: "+temp.to_s
temp = cl2.get_radio
puts "El valor del radio del cilindro 2 es: "+temp.to_s

temp = cl1.get_altura
puts "El valor de la altura del cilindro 1 es: "+temp.to_s
temp = cl2.get_altura
puts "El valor de la altura del cilindro 2 es: "+temp.to_s

# Calculamos el volumen otra vez
temp = cl1.volumen
puts "El valor del volumen del cilindro 1 es: "+temp.to_s
temp = cl2.volumen
puts "El valor del volumen del cilindro 2 es: "+temp.to_s


