# Data Catalog for Gold Layer

## Overview
La capa Gold es la representación de los datos a nivel de negocio, estructurada para soportar casos de uso analíticos y de reportes. Está compuesta por **tablas de dimensiones** y **tablas de hechos** para métricas de negocio específicas.

---

### 1. **gold.dim_customers**
- **Propósito:** Almacena los detalles de los clientes, enriquecidos con datos demográficos y geográficos.
- **Columnas:**

| Column Name      | Data Type     | Description                                                                                   |
|------------------|---------------|-----------------------------------------------------------------------------------------------|
| customer_key     | INT           | Llave sustituta que identifica de forma única cada registro de cliente en la tabla de dimensión. |
| customer_id      | INT           | Identificador numérico único asignado a cada cliente.                                         |
| customer_number  | NVARCHAR(50)  | Identificador alfanumérico que representa al cliente, usado para seguimiento y referencia.    |
| first_name       | NVARCHAR(50)  | Nombre del cliente, tal como está registrado en el sistema.                                   |
| last_name        | NVARCHAR(50)  | Apellido del cliente.                                                                         |
| country          | NVARCHAR(50)  | País de residencia del cliente (p. ej., 'Australia').                                         |
| marital_status   | NVARCHAR(50)  | Estado civil del cliente (p. ej., 'Married', 'Single').                                       |
| gender           | NVARCHAR(50)  | Género del cliente (p. ej., 'Male', 'Female', 'n/a').                                         |
| birthdate        | DATE          | Fecha de nacimiento del cliente, con formato YYYY-MM-DD (p. ej., 1971-10-06).                 |
| create_date      | DATE          | Fecha y hora en que se creó el registro del cliente en el sistema.                            |

---

### 2. **gold.dim_products**
- **Propósito:** Proporciona información sobre los productos y sus atributos.
- **Columnas:**

| Column Name         | Data Type     | Description                                                                                   |
|---------------------|---------------|-----------------------------------------------------------------------------------------------|
| product_key         | INT           | Llave sustituta que identifica de forma única cada registro de producto en la tabla de dimensión de productos. |
| product_id          | INT           | Identificador único asignado al producto para seguimiento y referencia internos.              |
| product_number      | NVARCHAR(50)  | Código alfanumérico estructurado que representa el producto, usado a menudo para categorización o inventario. |
| product_name        | NVARCHAR(50)  | Nombre descriptivo del producto, con detalles clave como tipo, color y talla.                 |
| category_id         | NVARCHAR(50)  | Identificador único de la categoría del producto, que lo vincula con su clasificación general. |
| category            | NVARCHAR(50)  | Clasificación general del producto (p. ej., Bikes, Components) para agrupar artículos relacionados. |
| subcategory         | NVARCHAR(50)  | Clasificación más detallada del producto dentro de la categoría, como el tipo de producto.    |
| maintenance_required| NVARCHAR(50)  | Indica si el producto requiere mantenimiento (p. ej., 'Yes', 'No').                           |
| cost                | INT           | Costo o precio base del producto, expresado en unidades monetarias.                           |
| product_line        | NVARCHAR(50)  | Línea o serie específica a la que pertenece el producto (p. ej., Road, Mountain).             |
| start_date          | DATE          | Fecha en que el producto quedó disponible para la venta o el uso.                             |

---

### 3. **gold.fact_sales**
- **Propósito:** Almacena los datos transaccionales de ventas con fines analíticos.
- **Columnas:**

| Column Name     | Data Type     | Description                                                                                   |
|-----------------|---------------|-----------------------------------------------------------------------------------------------|
| order_number    | NVARCHAR(50)  | Identificador alfanumérico único de cada orden de venta (p. ej., 'SO54496').                  |
| product_key     | INT           | Llave sustituta que vincula la orden con la tabla de dimensión de productos.                  |
| customer_key    | INT           | Llave sustituta que vincula la orden con la tabla de dimensión de clientes.                   |
| order_date      | DATE          | Fecha en que se realizó la orden.                                                             |
| shipping_date   | DATE          | Fecha en que la orden se envió al cliente.                                                    |
| due_date        | DATE          | Fecha de vencimiento del pago de la orden.                                                    |
| sales_amount    | INT           | Valor monetario total de la venta para la línea, en unidades enteras de moneda (p. ej., 25).  |
| quantity        | INT           | Número de unidades del producto pedidas en la línea (p. ej., 1).                              |
| price           | INT           | Precio por unidad del producto en la línea, en unidades enteras de moneda (p. ej., 25).       |
