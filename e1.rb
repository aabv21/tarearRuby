=begin
  Ejercicio #1 de La Tarea sobre Ruby
  Autores: Andrés Buelvas 13-10184
          Miguel Canedo 13-10214
  Fecha: 14/03/18
=end

# Clase Circulo que representa a un Circulo sencillo
class Circulo

  # Constructor de la clase Circulo
  def initialize radio
    if radio <= 0
      raise 'Radio Invalido'
    else
      @radio = radio
    end
  end

  # Metodo que permite colocar el radio al Circulo
  def set_radio radio
    if radio <= 0
      raise 'Radio Invalido'
    else
      @radio = radio
    end
  end

  # Metodo que permite obtener el radio del Circulo
  def get_radio
    @radio
  end

  # Metodo que calcula y retorna el area del Circulo
  def area
    Math::PI * (@radio**2)
  end
end

# Clase Cilindro que representa a un Cilindro
class Cilindro < Circulo

  # Constructor de la Clase Cilindro
  def initialize radio, altura
    super radio
    if altura <= 0
      raise 'Altura Invalido'
    else
      @altura = altura
    end
  end

  # Metodo que permite colocar la altura al Cilindro
  def set_altura altura
    if altura <= 0
      raise 'Altura Invalido'
    else
      @altura = altura
    end
  end

  # Metodo que retorna la altura del Cilindro
  def get_altura
    @altura
  end

  # Metodo que calcula y retorna el volumen del Cilindro
  def volumen
    self.area*@altura
  end
end

# Corrida del Programa
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


