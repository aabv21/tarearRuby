=begin
  Ejercicio #2 de La Tarea sobre Ruby
  Autores: Andrés Buelvas 13-10184
          Miguel Canedo 13-10214
  Fecha: 14/03/18
=end

# Clase Float (Flotante)
class Float

  # Metodo que convierte el flotante respectivo en un 'Dolar'
  def dolares
    Dolar.new self
  end

  # Metodo que convierte el flotante respectivo en un 'Yen'
  def yens
    Yen.new self
  end

  # Metodo que convierte el flotante respectivo en un 'Euro'
  def euros
    Euro.new self
  end

  # Metodo que convierte el flotante respectivo en un 'Bolivar'
  def bolivares
    Bolivar.new self
  end

  # Metodo que convierte el flotante respectivo en un 'Bitcoin'
  def bitcoins
    Bitcoin.new self
  end
end

# Clase Moneda que representa a una moneda cualquiera
class Moneda

  attr_accessor :valor

  # Constructor de la Clase Moneda
  def initialize arg
    @valor = arg
  end

  # Metodo que calcula que reciba un atomo entre: :dolares, :yens,
  # :euros, :bolivares y :bitcoins y convierta la moneda en aquella
  # representada por el atomo propuesto.
  def en id
    case id
      when :dolares
        self.enAux :dolares

      when :yens
        self.enAux :yens

      when :euros
        self.enAux :euros

      when :bolivares
        self.enAux :bolivares

      when :bitcoins
        self.enAux :bitcoins
    end
  end

  # Metodo que permite comparar dos monedas
  def comparar otraMoneda
    otraMoneda.compararAux self
  end
end

# Subclase Dolar que representa al tipo de moneda 'Dolar'
class Dolar < Moneda

  # Constructor de la Clase 'Dolar'
  def initialize arg
    super arg
  end

  # Metodo auxiliar del metodo comparar que se encuentra en la clase Moneda que
  # dice si la moneda preguntada es mayor, menor o igual a la moneda con la
  # cual se comparo
  def compararAux otraMoneda

    otroValor = otraMoneda.en(:dolares).valor # Valor de la segunda moneda

    if otroValor < @valor
      :menor
    elsif otroValor == @valor
      :igual
    else
      :mayor
    end
  end

  # Metodo Auxiliar del metodo 'en' de la clase Moneda que realiza los calculos
  # y devuelve el nuevo valor en el cambio propuesto
  def enAux id
    case id
      when :dolares
        Dolar.new@valor*1
      when :yens
        Yen.new@valor*106.56
      when :euros
        Euro.new@valor*0.80
      when :bolivares
        Bolivar.new@valor*216164.85
      when :bitcoins
        Bitcoin.new@valor*0.000108
    end
  end
end

# Subclase Yen que representa al tipo de moneda 'Yen'
class Yen < Moneda

  # Constructor de la Clase 'Yen'
  def initialize arg
    super arg
  end

  # Metodo auxiliar del metodo comparar que se encuentra en la clase Moneda que
  # dice si la moneda preguntada es mayor, menor o igual a la moneda con la
  # cual se comparo
  def compararAux otraMoneda

    otroValor = otraMoneda.en(:yens).valor # Valor de la segunda moneda

    if otroValor < @valor
      :menor
    elsif otroValor == @valor
      :igual
    else
      :mayor
    end
  end

  # Metodo Auxiliar del metodo 'en' de la clase Moneda que realiza los calculos
  # y devuelve el nuevo valor en el cambio propuesto
  def enAux id
    case id
      when :dolares
        Dolar.new@valor*0.00938
      when :yens
        Yen.new@valor*1
      when :euros
        Euro.new@valor*	0.00757
      when :bolivares
        Bolivar.new@valor*2027.62
      when :bitcoins
        Bitcoin.new@valor*0.0000010
    end
  end
end

# Subclase Euro que representa al tipo de moneda 'Euro'
class Euro < Moneda

  # Constructor de la Clase 'Euro'
  def initialize arg
    super arg
  end

  # Metodo auxiliar del metodo comparar que se encuentra en la clase Moneda que
  # dice si la moneda preguntada es mayor, menor o igual a la moneda con la
  # cual se comparo
  def compararAux otraMoneda

    otroValor = otraMoneda.en(:euros).valor # Valor de la segunda moneda

    if otroValor < @valor
      :menor
    elsif otroValor == @valor
      :igual
    else
      :mayor
    end
  end

  # Metodo Auxiliar del metodo 'en' de la clase Moneda que realiza los calculos
  # y devuelve el nuevo valor en el cambio propuesto
  def enAux id
    case id
      when :dolares
        Dolar.new@valor*	1.23
      when :yens
        Yen.new@valor*132.10
      when :euros
        Euro.new@valor*1
      when :bolivares
        Bolivar.new@valor*268169.76
      when :bitcoins
        Bitcoin.new@valor*0.00013
    end
  end
end

# Subclase Bolivar que representa al tipo de moneda 'Bolivar'
class Bolivar < Moneda

  # Constructor de la Clase Bolivar
  def initialize arg
    super arg
  end

  # Metodo auxiliar del metodo comparar que se encuentra en la clase Moneda que
  # dice si la moneda preguntada es mayor, menor o igual a la moneda con la
  # cual se comparo
  def compararAux otraMoneda

    otroValor = otraMoneda.en(:bolivares).valor # Valor de la segunda moneda

    if otroValor < @valor
      :menor
    elsif otroValor == @valor
      :igual
    else
      :mayor
    end
  end

  # Metodo Auxiliar del metodo 'en' de la clase Moneda que realiza los calculos
  # y devuelve el nuevo valor en el cambio propuesto
  def enAux id
    case id
      when :dolares
        Dolar.new@valor*0.00000462609
      when :yens
        Yen.new@valor*0.00049298978
      when :euros
        Euro.new@valor*0.00000372898
      when :bolivares
        Bolivar.new@valor*1
      when :bitcoins
        Bitcoin.new@valor*0.00000000049961772
    end
  end
end

# Subclase Bitcoin que representa al tipo de moneda 'Bitcoin'
class Bitcoin < Moneda

  # Constructor de la Clase Bitcoin
  def initialize arg
    super arg
  end

  # Metodo auxiliar del metodo comparar que se encuentra en la clase Moneda que
  # dice si la moneda preguntada es mayor, menor o igual a la moneda con la
  # cual se comparo
  def compararAux otraMoneda

    otroValor = otraMoneda.en(:bitcoins).valor # Valor de la segunda moneda

    if otroValor < @valor
      :menor
    elsif otroValor == @valor
      :igual
    else
      :mayor
    end
  end

  # Metodo Auxiliar del metodo 'en' de la clase Moneda que realiza los calculos
  # y devuelve el nuevo valor en el cambio propuesto
  def enAux id
    case id
      when :dolares
        Dolar.new@valor*9315.86
      when :yens
        Yen.new@valor*992528.49
      when :euros
        Euro.new@valor*7862.07
      when :bolivares
        Bolivar.new@valor*2013761479.52
      when :bitcoins
        Bitcoin.new@valor*1
    end
  end
end

# Corrida del programa

# Probando la conversion de clases
puts 1.0.dolares.class.to_s
puts 1.0.euros.class.to_s
puts 1.0.yens.class.to_s
puts 1.0.bitcoins.class.to_s
puts 1.0.bolivares.class.to_s
puts ""

# Probando el metodo 'en'
puts 1.0.dolares.en(:bolivares).valor
puts 216500.0.bolivares.en(:dolares).valor
puts 3.14.bitcoins.en(:dolares).valor
puts 624.234.yens.en(:bolivares).valor
puts ""

# Probando el metodo comaparar (1$ = 216164.85 bsf)
puts 1.0.dolares.comparar(216165.85.bolivares)
puts 1.0.dolares.comparar(216164.85.bolivares)
puts 1.0.dolares.comparar(216163.85.bolivares)