# RetailPro — Proyecto de Data Analytics

## 1. Descripción del proyecto

RetailPro es una empresa distribuidora de tecnología que dispone de información de ventas, clientes y productos.

El proyecto busca organizar y analizar estos datos para identificar oportunidades de crecimiento, detectar variaciones en el desempeño comercial y facilitar la toma de decisiones basada en información.

A lo largo del curso de Data Analytics se desarrollaron distintas etapas de almacenamiento, consulta, limpieza, transformación y análisis de datos.

## 2. Propósito del análisis

Identificar los productos, categorías, clientes y ubicaciones geográficas asociados a las principales variaciones en las ventas de RetailPro durante los últimos seis meses disponibles, de forma de priorizar acciones comerciales que permitan corregir caídas o potenciar oportunidades de crecimiento.

### Indicadores principales (KPIs)

Los cuatro indicadores definidos inicialmente para el proyecto son:

| KPI | Descripción |
|---|---|
| Ventas Totales | Monto total facturado durante el período analizado. |
| Variación de Ventas (%) | Aumento o disminución porcentual de las ventas respecto al período anterior. |
| Producto con Mayor Variación | Producto que presenta el cambio más significativo en sus ventas entre períodos. |
| Concentración del Principal Cliente (%) | Porcentaje de las ventas totales correspondiente al cliente de mayor facturación. |

Estos indicadores constituyen la base del análisis ejecutivo y orientan el diseño del dashboard de RetailPro.

## 3. Modelo de datos relacional

En el Módulo 3 se desarrolló una base de datos relacional en SQL Server, compuesta por cuatro tablas principales:

| Tabla | Descripción |
|---|---|
| `clientes` | Información de identificación y características de los clientes. |
| `productos` | Catálogo de productos comercializados, precios y categorías asociadas. |
| `categorias` | Clasificación de los productos según su categoría comercial. |
| `ventas` | Registro de las transacciones, incluyendo fechas, clientes, productos, cantidades y precios unitarios. |

### Relaciones entre tablas

Las tablas se vinculan mediante claves primarias (PK) y claves foráneas (FK):

- `clientes.id_cliente` → `ventas.id_cliente`
- `productos.id_producto` → `ventas.id_producto`
- `categorias.id_categoria` → `productos.id_categoria`

Estas relaciones permiten integrar la información comercial y realizar consultas que combinan diferentes dimensiones del negocio, manteniendo la integridad de los datos.

## 4. Herramientas utilizadas

| Herramienta | Aplicación en el proyecto |
|---|---|
| SQL Server | Creación y almacenamiento de la base de datos relacional. |
| SQL Server Management Studio (SSMS) | Desarrollo, ejecución y validación de consultas SQL. |
| SQL | Consultas de análisis comercial, agregaciones, filtros y relaciones mediante JOIN. |
| Power Query | Limpieza y transformación de datos, tratamiento de duplicados, valores nulos y combinación de tablas. |
| Power BI Desktop | Modelado analítico, relaciones entre tablas y visualización de información. |
| DAX | Desarrollo de medidas para calcular indicadores comerciales y comparaciones temporales. |
| GitHub | Almacenamiento, organización y documentación de los archivos del proyecto. |
| ChatGPT | Apoyo para revisar consultas SQL, generar insights y elaborar documentación técnica. |

## 5. Ejecución de los scripts SQL

Para ejecutar los scripts desarrollados durante el proyecto es necesario disponer de Microsoft SQL Server y SQL Server Management Studio (SSMS).

### Procedimiento

1. Abrir SQL Server Management Studio (SSMS).
2. Conectarse a una instancia de SQL Server.
3. Crear o seleccionar la base de datos correspondiente.
4. Abrir el script de creación y carga de datos del Módulo 3.
5. Ejecutar el script para generar las tablas y cargar los registros iniciales.
6. Ejecutar posteriormente los scripts de consultas analíticas de los Módulos 4 y 5.
7. Verificar que las consultas se ejecuten correctamente y que los resultados obtenidos sean coherentes con los datos disponibles.

**Precaución:** antes de ejecutar scripts que contengan instrucciones como `DROP TABLE`, `DELETE` o `UPDATE`, se recomienda revisar su contenido para evitar eliminar o modificar información accidentalmente.

## 6. Aplicación de los resultados

Las consultas SQL permiten obtener indicadores relacionados con la facturación, el comportamiento de los productos y la actividad comercial de los clientes.

Posteriormente, mediante Power Query y Power BI, se desarrollaron transformaciones y modelos analíticos para facilitar la interpretación de esta información.

Las medidas DAX permiten realizar cálculos adicionales, como ventas acumuladas, ventas del período anterior y variaciones porcentuales.

Los resultados obtenidos constituyen una base para el desarrollo de un dashboard ejecutivo orientado a comprender el desempeño comercial de RetailPro y apoyar la toma de decisiones.

Las conclusiones deben considerar el período y la cobertura de los datos disponibles, evitando generalizar resultados a períodos que no hayan sido analizados.
