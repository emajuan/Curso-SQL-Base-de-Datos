#1 y 2: Listado CategorìaNombre y Descripcion
SELECT CategoriaNombre, Descripcion
FROM categorias;

#3 y 4 Listado de productos y los discontinuados
SELECT ProductoNombre
FROM productos
WHERE Discontinuado = 1;
# No existen productos discontinuados

#Para el viernes hay que reunirse con el Proveedor 8. ¿Qué productos son los que nos provee?
SELECT *
FROM productos
WHERE ProveedorID = 8;

#Queremos conocer todos los productos cuyo precio unitario se encuentre entre 10 y 22.
SELECT ProductoNombre, PrecioUnitario
FROM productos
WHERE PrecioUnitario BETWEEN 10 AND 22

# Se define que un producto hay que solicitarlo al proveedor si sus unidades en stock son menores al Nivel de Reorden. ¿Hay productos por solicitar?
SELECT ProductoNombre, UnidadesStock, NivelReorden
FROM productos
WHERE UnidadesStock < Nivelreorden;

# Se quiere conocer todos los productos del listado anterior, pero que unidades pedidas sea igual a cero.
SELECT ProductoNombre, UnidadesPedidas
FROM productos
WHERE UnidadesPedidas = 0;

# Obtener un listado de todos los clientes con Contacto, Compania, Título, País. Ordenar el listado por País.
SELECT ClienteID, Compania, Contacto, Titulo, Pais
FROM clientes
ORDER BY Pais;

# Queremos conocer a todos los clientes que tengan un título “Owner”.
SELECT ClienteID, Contacto, Titulo
FROM clientes
WHERE Titulo = "Owner";

# El operador telefónico que atendió a un cliente no recuerda su nombre. Solo sabe que comienza con “C”. ¿Lo ayudamos a obtener un listado con todos los contactos que inician con la letra “C”?
SELECT ClienteID, Contacto, Titulo
FROM clientes
WHERE Contacto LIKE "C%";

# Obtener un listado de todas las facturas, ordenado por fecha de factura ascendente.
SELECT *
FROM facturas
ORDER BY FechaFactura;

# Ahora se requiere un listado de las facturas con el país de envío “USA” y que su correo (EnvioVia) sea distinto de 3.
SELECT *
FROM facturas
WHERE PaisEnvio = "USA" AND EnvioVia <> 3;

# ¿El cliente 'GOURL' realizó algún pedido?
SELECT *
FROM facturas
WHERE ClienteID = "GOURL";

# Se quiere visualizar todas las facturas de los empleados 2, 3, 5, 8 y 9.
SELECT *
FROM facturas
WHERE EmpleadoID IN (2,3,5,8,9);

# Obtener el listado de todos los productos ordenados descendentemente por precio unitario.
SELECT *
FROM productos
ORDER BY PrecioUnitario DESC;

# Obtener el listado de top 5 de productos cuyo precio unitario es el más caro.
SELECT *
FROM productos
ORDER BY PrecioUnitario DESC
LIMIT 5;

# Obtener un top 10 de los productos con más unidades en stock.
SELECT *
FROM productos
ORDER BY UnidadesStock DESC
LIMIT 10;

# Obtener un listado de FacturaID, ProductoID, Cantidad.
SELECT FacturaID, ProductoID, Cantidad
FROM facturadetalle;

# Ordenar el listado anterior por cantidad descendentemente.
SELECT FacturaID, ProductoID, Cantidad
FROM facturadetalle
ORDER BY Cantidad DESC;

# Filtrar el listado solo para aquellos productos donde la cantidad se encuentre entre 50 y 100.
SELECT FacturaID, ProductoID, Cantidad
FROM facturadetalle
WHERE Cantidad BETWEEN 50 and 100
ORDER BY Cantidad DESC;

# En otro listado nuevo, obtener un listado con los siguientes nombres de columnas: NroFactura (FacturaID), Producto (ProductoID), Total (PrecioUnitario*Cantidad).
SELECT FacturaID as NroFactura, ProductoID as Producto, round(PrecioUnitario*Cantidad,1) as Total
FROM facturadetalle;

# Obtener un listado de todos los clientes que viven en “Brazil" o “Mexico”, o que tengan un título que empiece con “Sales”. 
SELECT *
FROM clientes
WHERE Pais in ("Brazil","Mexico") 
AND Titulo LIKE ("Sales%");

# Obtener un listado de todos los clientes que pertenecen a una compañía que empiece con la letra "A".
SELECT *
FROM clientes
WHERE Compania like ("A%");

# Obtener un listado con los datos: Ciudad, Contacto y renombrarlo como Apellido y Nombre, Titulo y renombrarlo como Puesto, de todos los clientes que sean de la ciudad "Madrid".
SELECT Ciudad, Contacto as "Apellido y Nombre", Titulo as Puesto
FROM clientes;

# Obtener un listado de todas las facturas con ID entre 10000 y 10500
SELECT *
FROM facturas
WHERE facturaID BETWEEN 10000 AND 10500;

# Obtener un listado de todas las facturas con ID entre 10000 y 10500 o de los clientes con ID que empiecen con la letra “B”.
SELECT *
FROM facturas
WHERE facturaID BETWEEN 10000 AND 10500 OR ClienteID like ("B%");

# ¿Existen facturas que la ciudad de envío sea “Vancouver” o que utilicen el correo 3?
SELECT *
FROM facturas
WHERE CiudadEnvio = "Vancouver" or EnvioVia = 3;

# ¿Cuál es el ID de empleado de “Buchanan”? --> 5
SELECT *
FROM empleados
WHERE Notas like ("%Buchanan%");

# ¿Existen facturas con EmpleadoID del empleado del ejercicio anterior? (No relacionar, sino verificar que existan facturas)
SELECT *
FROM facturas
WHERE EmpleadoID = 5;