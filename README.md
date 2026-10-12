# SQL-Data-Warehouse
# Proyecto de Almacenamiento de Datos y Análisis

¡Bienvenido al repositorio del **Proyecto de Almacenamiento de Datos y Análisis**! 🚀
Este proyecto demuestra una solución integral de almacenamiento de datos y análisis, desde la creación de un almacén de datos hasta la generación de información útil. Diseñado como un proyecto de portafolio, destaca las mejores prácticas de la industria en ingeniería y análisis de datos.

---
## 🏗️ Arquitectura de Datos

La arquitectura de datos para este proyecto sigue las capas **Bronce**, **Plata** y **Oro** de la Arquitectura Medallion:
![Arquitectura de Datos](docs/data_architecture.png)

1. **Capa Bronce**: Almacena los datos sin procesar tal cual provienen de los sistemas de origen. Los datos se ingieren desde archivos CSV a una base de datos SQL Server.

2. **Capa Plata**: Esta capa incluye procesos de limpieza, estandarización y normalización de datos para prepararlos para el análisis.

3. **Capa Oro**: Alberga datos listos para el negocio, modelados en un esquema de estrella, necesarios para la elaboración de informes y análisis.

## 📖 Resumen del proyecto

Este proyecto incluye:

1. **Arquitectura de datos**: Diseño de un almacén de datos moderno utilizando las capas **Bronce**, **Plata** y **Oro** de la arquitectura Medallion.

2. **Pipelines ETL**: Extracción, transformación y carga de datos desde los sistemas de origen al almacén.

3. **Modelado de datos**: Desarrollo de tablas de hechos y dimensiones optimizadas para consultas analíticas.

4. **Análisis e informes**: Creación de informes y paneles basados ​​en SQL para obtener información útil.

🎯 Este repositorio es un excelente recurso para profesionales y estudiantes que buscan demostrar su experiencia en:
- Desarrollo SQL
- Arquitectura de datos
- Ingeniería de datos
- Desarrollo de pipelines ETL
- Modelado de datos
- Análisis de datos

---

## 🛠️ Enlaces y herramientas importantes:

¡Todo es gratis!

- **[Conjuntos de datos](datasets/):** Acceso al conjunto de datos del proyecto (archivos CSV).
- **[SQL Server Express](https://www.microsoft.com/en-us/sql-server/sql-server-downloads):** Servidor ligero para alojar su base de datos SQL.}
- **[SQL Server Management Studio (SSMS)](https://learn.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-ver16):** Interfaz gráfica de usuario para administrar e interactuar con bases de datos.
- **[DrawIO](https://www.drawio.com/):** Diseñe arquitecturas de datos, modelos, flujos y diagramas.
- **[Pasos del proyecto en Notion](https://thankful-pangolin-2ca.notion.site/SQL-Data-Warehouse-Project-16ed041640ef80489667cfe2f380b269?pvs=4):** Acceso a todas las fases y tareas del proyecto.

---

## 🚀 Requisitos del proyecto

### Creación del almacén de datos (Ingeniería de datos)

#### Objetivo
Desarrollar un almacén de datos moderno utilizando SQL Server para consolidar los datos de ventas, lo que permitirá generar informes analíticos y tomar decisiones informadas.

#### Especificaciones
- **Fuentes de datos**: Importar datos de dos sistemas de origen (ERP y CRM) proporcionados como archivos CSV.

- **Calidad de los datos**: Limpiar y resolver los problemas de calidad de los datos antes del análisis.
- **Integración**: Combine ambas fuentes en un único modelo de datos fácil de usar, diseñado para consultas analíticas.

- **Alcance**: Céntrese únicamente en el conjunto de datos más reciente; no se requiere historización de datos.

- **Documentación**: Proporcione documentación clara del modelo de datos para apoyar tanto a los responsables de negocio como a los equipos de análisis.

---

### **BI: Análisis e Informes (Análisis de Datos)**

#### Objetivo
Desarrollar análisis basados ​​en SQL para proporcionar información detallada sobre:
- **Comportamiento del cliente**
- **Rendimiento del producto**
- **Tendencias de ventas**

Esta información proporciona a las partes interesadas métricas clave para la toma de decisiones estratégicas.

Para más detalles, consulte [docs/requirements.md](docs/requirements.md).

## 📂 Estructura del repositorio
```
proyecto-almacén-de-datos/
│
├── datasets/ # Conjuntos de datos sin procesar utilizados para el proyecto (datos ERP y CRM)
│
├── docs/ # Documentación del proyecto y detalles de la arquitectura
│ ├── etl.drawio # Archivo Draw.io que muestra todas las diferentes técnicas y métodos de ETL
│ ├── data_architecture.drawio # Archivo Draw.io que muestra la arquitectura del proyecto
│ ├── data_catalog.md # Catálogo de conjuntos de datos, incluyendo descripciones de campos y metadatos
│ ├── data_flow.drawio # Archivo Draw.io para el diagrama de flujo de datos
│ ├── data_models.drawio # Archivo Draw.io para modelos de datos (esquema de estrella)
│ ├── naming-conventions.md # Directrices de nomenclatura consistentes para tablas, columnas y archivos
│
├── scripts/ # Scripts SQL para ETL y transformaciones
│ ├── bronze/ # Scripts para extraer y cargar datos sin procesar
│ ├── silver/ # Scripts para limpiar y transformar datos
│ ├── gold/ # Scripts para crear modelos analíticos
│
├── tests/ # Scripts de prueba y archivos de calidad
│
├── README.md # Descripción general del proyecto e instrucciones
├── LICENSE # Información de licencia del repositorio
├── .gitignore # Archivos y directorios que se ignorarán Git
└── requirements.txt # Dependencias y requisitos del proyecto
```

---

## 🛡️ Licencia

Este proyecto está bajo la licencia [MIT](LICENSE). Puedes usar, modificar y compartir este proyecto libremente, siempre y cuando se cite la fuente adecuadamente.

