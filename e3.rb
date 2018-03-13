class ProductoCartesiano
  def initialize arreglo1, arreglo2
    @arreglo1 = arreglo1
    @arreglo2 = arreglo2
  end

  def producto
    @arreglo1.each do |i|
      @arreglo2.each do |j|
        arreglo = [i, j]
        puts arreglo.to_s
      end
    end
  end

end

# Probando
A = [1,2,3]
B = [4,5,6]
prod = ProductoCartesiano.new A, B
prod.producto
