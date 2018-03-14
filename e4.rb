module DFS
  def dfs grafo
    hola
  end

  def find start, predicate
    hola
  end

  def path start, predicate
    hola
  end
end

# Clase ArbolBinario representa un Arbol Binario de Busqueda sencillo.
# Incluye los metodos del Modulo DFS.
class ArbolBinario
  include DFS

  attr_accessor :root

  # Clase Nodo que se encarga de almacenar los datos de un Arbol Binario
  # ademas de sus hijos en dicho Arbol.
  class Nodo
    attr_accessor :dato, :izq, :der

    # Metodo inicilizador de la clase Nodo.
    def initialize r
      @dato = r 	# Dato que almacena el Nodo.
      @izq = nil 	# Hijo Izquierdo del Nodo.
      @der = nil	# Hijo Derecho del Nodo.
    end

    # Metodo que devuelve los hijos de Nodo empaquetados en un arreglo.
    def siguientes
      [@izq, @der]
    end

    # Metodo que devuleve la representacion en String de la clase Nodo.
    def to_s
      "#{dato}"
    end
  end

  # Metodo Inicilizador de la clase ArbolBinario.
  def inicialize
    @root = nil # Raiz del ArbolBinario.
  end

  # Metodo que inserta de manera ordenada un nuevo elemento en el Arbol Binario.
  def insertar (nuevo, nodo = @root)
    if @root
      if nodo.dato >= nuevo
        if nodo.izq
          insertar(nuevo, nodo.izq)
        else
          nodo.izq = Nodo.new(nuevo)
        end
      else
        if nodo.der
          insertar(nuevo, nodo.der)
        else
          nodo.der = Nodo.new(nuevo)
        end
      end
    else
      @root = Nodo.new(nuevo)
    end
  end

  # Metodo que devuleve la representacion en String de la clase ArbolBinario.
  def to_s
    nodos = [@root]
    s = "Arbol Binario: "
    while !nodos.empty?
      s = s + nodos[0].to_s + " "

      nodos << nodos[0].izq if nodos[0].izq
      nodos << nodos[0].der if nodos[0].der

      nodos = nodos.drop(1)
    end

    s
  end

end

# Clase GrafoDirigido representa un Grafo donde sus lados posee una direccion unica.
# Incluye los metodos del Modulo DFS.
class GrafoDirigido
  include DFS

  attr_accessor :vertices

  # Clase Vertice que se encarga de almacenar los datos de un Grafo Dirigido,
  # ademas de los vertices a los que se dirige.
  class Vertice
    attr_accessor :dato, :vecinos

    # Metodo inicilizador de la clase Veritice.
    def initialize(dato)
      @dato = dato 	# Dato que almacena el Vertice.
      @vecinos = []	# Vertices a los que se dirige este.
    end

    # Metodo que devuelve el arreglo de Vertices a destinos desde este.
    def siguientes
      @vecinos
    end

    # Metodo que devuleve la representacion en String de la clase Vertice.
    def to_s
      "#{dato}"
    end

  end

  # Metodo inicilizador de la clase GrafoNoDirigido.
  def initialize
    @vertices = []
  end

  # Metodo que agrega un Vertice al Grafo.
  def agregarVertice(dato)
    @vertices << Vertice.new(dato)
  end

  # Metodo que agrega un Lado desde el Vertice 'origen'
  # hasta Vertice 'destino'.
  def agregarLado(origen, destino)
    desde = vertices.index { |v| v.dato == origen }
    hasta = vertices.index { |v| v.dato == destino }

    vertices[desde].vecinos << vertices[hasta]
  end

  # Metodo que devuleve la representacion en String de la clase GrafoNoDirigido.
  def to_s
    s = "Grafo No Dirigido: "
    vertices.each { |v| s += v.to_s }
    s
  end
end

# Probando

###  Arbol Binario.
arbol = ArbolBinario.new()
arbol.insertar(2)
arbol.insertar(6)
arbol.insertar(3)
arbol.insertar(2)
arbol.insertar(1)

puts arbol

### Grafo No Dirigido.
grafo = GrafoDirigido.new()

# Vertices
grafo.agregarVertice(6)
grafo.agregarVertice(2)
grafo.agregarVertice(3)
grafo.agregarVertice(4)

# Lados
grafo.agregarLado(6,4)
grafo.agregarLado(6,3)
grafo.agregarLado(2,4)
grafo.agregarLado(4,3)
grafo.agregarLado(3,2)

puts grafo.to_s