from flask import Flask,render_template,abort,request,redirect,url_for
app = Flask(__name__)

@app.route("/")
def inicio():
    return "Hola mundo"

@app.route("/login")
def login():
    return "otra ruta"  

@app.route("/productos")
def ConsultarProductos():
    #return "Retorna la lista de productos"  
    return render_template("productos/consultaGeneral.html")   

@app.route("/productos/agregar")
def agregarProducto():
    return "agregando un producto" 

@app.route("/productos/actualizar")
def actualizarProducto():
    return "actualizando un producto"       

@app.route("/cesta")
def consultarCesta():
    return "consultando la cesta de compra"

@app.route("/productos/categoria/<int:id>")
def consultarProductosCategoria(id):
    return "Conultando los productos de la categoria: "+str(id)

@app.route("/clientes/<nombre>")
def consultarCliente(nombre):
    return "Consultando al cliente " +nombre

@app.route("/productos/<float:precio>")
def consultarProductosPorPrecio(precio):
    return "Hola"+str(precio)   

@app.route("/")
def inicio():
    return render_template('login.html')

@app.route("/login", methods=['POST'])
def login():
    correo=request.form['correo']
    return "Validando al usuario: "+correo

@app.route("/")
def inicion():
    return render_template('principal.html')

@app.route("/validarSesion")
def validarSesion():
    return render_template('/usuarios/login.html')

@app.route("/registrarCuenta")
def registrarCuenta():
    return render_template('/usuarios/registrarCuenta.html')    

if __name__=='__main__':
     app.run(debug=True)   