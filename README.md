RetailPro — Análisis comercial con SQL

Descripción

RetailPro es un proyecto de análisis de datos para una distribuidora de tecnología. El objetivo es integrar información de ventas, clientes y productos para obtener indicadores que faciliten la toma de decisiones comerciales.


Objetivos

- Consolidar la información mediante una base de datos relacional.

- Analizar facturación mensual, cantidad de pedidos y ticket promedio.

- Identificar los productos que generan mayor facturación.

- Detectar clientes sin compras y productos sin ventas.


Herramientas

- SQL Server (SQL Server Managment Studio): creación de tablas, relaciones y consultas analíticas.

- SQL Server Management Studio (SSMS): ejecución y validación de scripts.

- GitHub: versionado y documentación del proyecto.


Modelo de datos

- El esquema está compuesto por cuatro tablas principales:

  . ventas: operaciones comerciales, cantidades, precios y fechas.

  . clientes: información descriptiva de los clientes.

  . productos: catálogo de productos.

  . categorias: clasificación de los productos.

  . fechas: una tabla que funciona como tabla de fechas para realizar análisis en periodos de tiempo. 


Cómo ejecutar los scripts SQL

- Abrir SQL Server Management Studio y conectarse a una instancia de SQL Server.

- Crear o seleccionar la base de datos del proyecto.

- Ejecutar primero el script de creación y carga de tablas.

- Ejecutar los scripts de análisis y consultas, respetando el orden de dependencias.

- Revisar los resultados obtenidos en SSMS.

Importante: los scripts utilizan sintaxis T-SQL de SQL Server. Antes de ejecutar scripts que contengan DROP TABLE, verificar su contenido, ya que pueden eliminar tablas existentes.



Consultas principales

- Integración de ventas y tablas descriptivas mediante INNER JOIN.

- Resumen mensual de facturación, pedidos y ticket promedio.

- Ranking de los cinco productos con mayor facturación.

- Identificación de clientes sin compras y productos sin ventas mediante LEFT JOIN.


Alcance

Proyecto práctico de Data Analytics enfocado en modelado relacional, consultas SQL y generación de información útil para decisiones comerciales.
