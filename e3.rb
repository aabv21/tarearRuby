=begin
  Ejercicio #3 de La Tarea sobre Ruby
  Autores: Andrés Buelvas 13-10184
          Miguel Canedo 13-10214
  Fecha: 14/03/18
=end

# Clase ProductoCartesiano
class ProductoCartesiano

  # Constructor de la Clase ProductoCartesiano
  def initialize arreglo1, arreglo2
    @arreglo1 = arreglo1
    @arreglo2 = arreglo2
  end

  # Metodo que llevará a cabo el producto cartesiano y lo imprimirá en pantalla
  def producto
    @arreglo1.each { |i| @arreglo2.each { |j| yield [i,j] } }
  end
end

# Corrida del programa
A = ['a','b','c']
B = [4,5,6]
prod = ProductoCartesiano.new A, B
prod.producto do
  |x| print x
  puts
end
