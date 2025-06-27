# Instituto Tecnológico de Costa Rica  
**Escuela de Ingeniería en Computación**  
**Lenguajes de Programacion - IC4700**  
**I Semestre de 2025**  

### Estudiantes:
- Sebastian Calvo Hernández - 2022099320
- Isaac Gamboa Ureña – 2022437592


### Profesor:
- Bryan Hernández Sibaja

---

# Sistema de Gestión de Productos

Este proyecto implementa un sistema de gestión de productos desarrollado en Ruby on Rails. Permite agregar, editar, eliminar y consultar productos, gestionar inventario, historial de movimientos de stock y generar facturas. La interfaz de usuario está diseñada de forma moderna y responsiva, usando HTML, CSS y componentes Rails con clases personalizadas para los botones.

Repositorio del proyecto en GitHub:  
https://github.com/SebasCH04/ruby-billing-system


## Índice

- [Pasos de instalación del programa](#pasos-de-instalación-del-programa)  
- [Manual de usuario](#manual-de-usuario)  
- [Arquitectura lógica utilizada](#arquitectura-lógica-utilizada)  
  - [Módulos principales](#módulos-principales)  
  - [Explicación del funcionamiento](#explicación-del-funcionamiento)

---

## Pasos de instalación del programa

### Requisitos:

- Sistema operativo: Linux, macOS o Windows con WSL
- Tener instalado:
  - Ruby (v3.4+)
  - Rails (v8.0+)
  - Bundler
  - Node.js
  - SQLite o PostgreSQL

### Instalación:

1. **Clonar el repositorio:**

```bash
git clone https://github.com/SebasCH04/ruby-billing-system
cd product-management-app
```

2. **Instalar dependencias:**

```bash
bundle install
```

3. **Configurar la base de datos:**

```bash
rails db:create db:migrate db:seed
```

4. **Ejecutar el servidor:**

```bash
rails server
```

---

## Manual de usuario

Una vez iniciado el sistema, la interfaz principal muestra la lista de productos y botones de navegación. Las acciones disponibles incluyen:

1. **Agregar nuevo producto**  
   - Botón verde **"Add Product"**
   - Formulario para ingresar nombre, SKU, precio, cantidad y umbral de stock

2. **Editar producto existente**  
   - Botón amarillo **"Edit Product"** en la vista de detalle o desde la tabla

3. **Eliminar producto**  
   - Botón rojo **"Delete Product"** con confirmación de seguridad

4. **Ver detalles de producto**  
   - Muestra los campos y un historial de movimientos de stock

5. **Registrar movimiento de stock**  
   - Se agregan entradas o salidas de inventario con nota y cantidad

6. **Generar o ver facturas**  
   - Botón **"Show/Create Invoices"** en la vista principal

7. **Cambiar tasas de impuesto**  
   - Botón **"Change Tax Rates"** para crear o editar tasas

8. **Gestionar clientes**  
   - Botón **"Manage Clients"**

---

## Arquitectura lógica utilizada

Este sistema sigue una arquitectura MVC proporcionada por Rails y mantiene una separación clara de responsabilidades.

### Módulos principales:

- **Models**
  - `Product`: modelo principal que contiene nombre, SKU, precio, cantidad y umbral
  - `StockMovement`: controla cambios de inventario
  - `Invoice`, `InvoiceItem`: para facturación
  - `Client`, `TaxRate`: relaciones necesarias para el sistema comercial

- **Controllers**
  - `ProductsController`, `InvoicesController`, `ClientsController`, etc.
  - Separan la lógica de negocio de la vista

- **Views**
  - HTML con `<%= %>` ERB templating
  - Diseño moderno usando clases personalizadas para botones, tablas y secciones

### Explicación del funcionamiento:

1. **Inicio del sistema:**
   - El servidor Rails inicia en `localhost:3000` mediante `rails server`.

2. **Interacción con el usuario:**
   - Navegación por botones con clases `btn btn-primary`, `btn-danger`, etc.
   - Formularios validados y navegación responsiva.

3. **Gestión de productos:**
   - CRUD completo de productos desde la interfaz web.

4. **Persistencia de datos:**
   - Base de datos SQLite (o PostgreSQL si se configura).
   - Migraciones, relaciones y validaciones desde ActiveRecord.

5. **Diseño moderno y responsivo:**
   - Estilos CSS personalizados para contenedores, botones, tablas y secciones de contenido.

6. **Separación de responsabilidades:**
   - Cada controlador maneja un recurso; las vistas están organizadas por recurso.
   - El CSS encapsula todos los componentes visuales para mayor claridad.

---