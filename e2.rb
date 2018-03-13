# Clase Float
class Float
  def dolares
    Dolar.new self
  end
  def yenes
    Yen.new self
  end
  def euros
    Euro.new self
  end
  def bolivares
    Bolivar.new self
  end
  def bitcoins
    Bitcoin.new self
  end
end

# Clase Moneda
class Moneda
  attr_accessor :valor
  # Constructor
  def initialize arg
    @valor = arg
  end

  # Convertir la moneda
  def en id
    case id
      when :dolares
        return Dolar.new@valor*10
      when :yens
        return Yen.new@valor*10
      when :euros
        return Euro.new@valor*10
      when :bolivares
        return Bolivar.new@valor*216164.85
      when :bitcoins
        return Bitcoin.new@valor*10
    end
  end
  # Compara las monedas
  #def comparar monedaAComparar
    #monedaAComparar.compararAux(self)
    #Instruccion de comparacion
  #end
  # Auxiliar de la funcion comparar
  #def compararAux monedaAComparar
    #valor = monedaAComparar.en(:bolivares)
  #end
end
# Subclase Yen
class Dolar < Moneda
  def initialize arg
    super arg
  end
end

# Subclase Yen
class Yen < Moneda
  def initialize arg
    super arg
  end
end

# Subclase Euro
class Euro < Moneda
  def initialize arg
    super arg
  end
end

# Subclase Bolivar
class Bolivar < Moneda
  def initialize arg
    super arg
  end
end

# Subclase Bitcoin
class Bitcoin < Moneda
  def initialize arg
    super arg
  end
end

# Probando
x = 12.2.dolares.en(:bolivares)
puts x.valor