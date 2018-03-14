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
    if self.class.to_s == "Dolar"
      case id
        when :dolares
          return Dolar.new@valor*1
        when :yens
          return Yen.new@valor*106.56
        when :euros
          return Euro.new@valor*0.80
        when :bolivares
          return Bolivar.new@valor*216164.85
        when :bitcoins
          return Bitcoin.new@valor*0.000108
      end
    elsif self.class.to_s == "Yen"
      case id
        when :dolares
          return Dolar.new@valor*0.00938
        when :yens
          return Yen.new@valor*1
        when :euros
          return Euro.new@valor*	0.00757
        when :bolivares
          return Bolivar.new@valor*2027.62
        when :bitcoins
          return Bitcoin.new@valor*0.0000010
      end
    elsif self.class.to_s == "Euro"
      case id
        when :dolares
          return Dolar.new@valor*	1.23
        when :yens
          return Yen.new@valor*132.10
        when :euros
          return Euro.new@valor*1
        when :bolivares
          return Bolivar.new@valor*268169.76
        when :bitcoins
          return Bitcoin.new@valor*0.00013
      end
    elsif self.class.to_s == "Bolivar"
      case id
        when :dolares
          return Dolar.new@valor*0.00000462609
        when :yens
          return Yen.new@valor*0.00049298978
        when :euros
          return Euro.new@valor*0.00000372898
        when :bolivares
          return Bolivar.new@valor*1
        when :bitcoins
          return Bitcoin.new@valor*0.00000000049961772
      end
    elsif self.class.to_s == "Bitcoin"
      case id
        when :dolares
          return Dolar.new@valor*9315.86
        when :yens
          return Yen.new@valor*992528.49
        when :euros
          return Euro.new@valor*7862.07
        when :bolivares
          return Bolivar.new@valor*2013761479.52
        when :bitcoins
          return Bitcoin.new@valor*1
      end
    end
  end
end
# Subclase Yen
class Dolar < Moneda
  def initialize arg
    super arg
  end
  # Compara las monedas
  def comparar otraMoneda
    otraMoneda.compararAux self
  end
  # Auxiliar de la funcion comparar
  def compararAux otraMoneda
    otroValor = otraMoneda.en(:dolares).valor
    if otroValor < @valor
      return :menor
    elsif otroValor == @valor
      return :igual
    else
      return :mayor
    end
  end
end

# Subclase Yen
class Yen < Moneda
  def initialize arg
    super arg
  end
  # Compara las monedas
  def comparar otraMoneda
    otraMoneda.compararAux self
  end
  # Auxiliar de la funcion comparar
  def compararAux otraMoneda
    otroValor = otraMoneda.en(:yens).valor
    if otroValor < @valor
      return :menor
    elsif otroValor == @valor
      return :igual
    else
      return :mayor
    end
  end
end

# Subclase Euro
class Euro < Moneda
  def initialize arg
    super arg
  end
  # Compara las monedas
  def comparar otraMoneda
    otraMoneda.compararAux self
  end
  # Auxiliar de la funcion comparar
  def compararAux otraMoneda
    otroValor = otraMoneda.en(:euros).valor
    if otroValor < @valor
      return :menor
    elsif otroValor == @valor
      return :igual
    else
      return :mayor
    end
  end
end

# Subclase Bolivar
class Bolivar < Moneda
  def initialize arg
    super arg
  end
  # Compara las monedas
  def comparar otraMoneda
    otraMoneda.compararAux self
  end
  # Auxiliar de la funcion comparar
  def compararAux otraMoneda
    otroValor = otraMoneda.en(:bolivares).valor
    if otroValor < @valor
      return :menor
    elsif otroValor == @valor
      return :igual
    else
      return :mayor
    end
  end
end

# Subclase Bitcoin
class Bitcoin < Moneda
  def initialize arg
    super arg
  end
  # Compara las monedas
  def comparar otraMoneda
    otraMoneda.compararAux self
  end
  # Auxiliar de la funcion comparar
  def compararAux otraMoneda
    otroValor = otraMoneda.en(:bitcoins).valor
    if otroValor < @valor
      return :menor
    elsif otroValor == @valor
      return :igual
    else
      return :mayor
    end
  end
end

# Probando
z = Dolar.new 1.0
puts z.class.to_s
t = z.en(:bolivares)
puts t.valor
x = 1.0.dolares.en(:bolivares)
y = 216500.0.bolivares.en(:dolares)
puts x.valor
puts y.valor

t = 216500.0.bolivares.comparar(1.0.dolares)
k = 1.0.bitcoins.comparar(8000.0.euros)
puts k.to_s