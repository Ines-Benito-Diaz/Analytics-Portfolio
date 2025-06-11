# 📖 Diccionario de datos
Campo, Tipo y Descripción


### Tabla: Ciudades

| Campo              | Tipo    | Descripción                                            |
|--------------------|---------|--------------------------------------------------------|
| ciudad             | String  | Nombre de la ciudad (PK).                              |
| comunidad_autonoma  | String  | Comunidad Autónoma a la que pertenece la ciudad.      |
| poblacion          | Integer | Población estimada de la ciudad.                       |
| superficie_km2     | Float   | Superficie en kilómetros cuadrados de la ciudad.      |
| precio_m2_medio    | Float   | Precio medio por metro cuadrado en la ciudad (€).     |
| latitud_centro     | Float   | Coordenada de latitud del centro de la ciudad.        |
| longitud_centro    | Float   | Coordenada de longitud del centro de la ciudad.       |


### Tabla: Barrios

| Campo              | Tipo    | Descripción                                              |
|--------------------|---------|----------------------------------------------------------|
| barrio             | String  | Nombre del barrio (PK).                                  |
| ciudad             | String  | Nombre de la ciudad a la que pertenece (FK).            |
| distrito           | String  | Distrito municipal (opcional) o clasificación interna.  |
| renta_media        | Float   | Estimación de la renta media anual del hogar en €       |
| precio_m2_barrio   | Float   | Precio medio por metro cuadrado en el barrio (€).       |
| latitud_barrio     | Float   | Coordenada de latitud aproximada del barrio.            |
| longitud_barrio    | Float   | Coordenada de longitud aproximada del barrio.           |
| num_colegios       | Integer | Número de colegios y centros educativos en el barrio.   |
| num_centros_salud  | Integer | Número de centros de salud u hospitales disponibles.    |
| num_estaciones_transp | Integer | Número de estaciones de transporte público (metro, bus, cercanías). |
| num_zonas_verdes   | Integer | Número de parques, jardines o zonas verdes disponibles. |
| nivel_servicios    | String  | Clasificación de la oferta de servicios: Bajo, Medio o Alto. |
| indice_seguridad   | Float   | Puntuación del índice de seguridad (escala 0-10).       |
| indice_contaminacion | Float | Puntuación del nivel de contaminación (escala 0-10; menor es mejor). |
| indice_accesibilidad | Float | Puntuación de accesibilidad a servicios y al centro (escala 0-10). |


### Tabla: Tipos de Inmueble

| Campo          | Tipo   | Descripción                                                   |
|----------------|--------|---------------------------------------------------------------|
| tipo_inmueble  | String | Tipo de inmueble (PK), ejemplo: Piso, Estudio, Dúplex, etc.  |
| descripcion    | String | Breve descripción de las características comunes del inmueble.|


### Tabla: Propiedades

| Campo             | Tipo     | Descripción                                               |
|-------------------|----------|-----------------------------------------------------------|
| id_propiedad      | Integer  | Identificador único de la propiedad (PK).                |
| ciudad            | String   | Ciudad a la que pertenece la propiedad (FK).             |
| barrio            | String   | Barrio donde se ubica la propiedad (FK).                  |
| tipo_operacion    | String   | Tipo de operación: Venta o Alquiler.                      |
| tipo_inmueble     | String   | Tipo de inmueble (FK).                                    |
| precio            | Float    | Precio total en euros.                                    |
| superficie_m2     | Float    | Superficie construida en metros cuadrados.               |
| habitaciones      | Integer  | Número de habitaciones o dormitorios.                     |
| baños             | Integer  | Número de baños.                                          |
| estado            | String   | Estado de conservación: Buen estado, Obra nueva, etc.    |
| año_construccion  | Integer  | Año de construcción del inmueble.                         |
| planta            | String   | Planta donde se ubica la propiedad (ej. Bajo, 1, Ático). |
| ascensor          | Boolean  | Indica si dispone de ascensor (True/False).               |
| terraza           | Boolean  | Indica si dispone de terraza (True/False).                |
| piscina           | Boolean  | Indica si dispone de piscina (True/False).                |
| garaje            | Boolean  | Indica si dispone de garaje (True/False).                 |
| trastero          | Boolean  | Indica si dispone de trastero (True/False).               |
| distancia_centro_km | Float  | Distancia en kilómetros al centro de la ciudad.           |
| fecha_publicacion | Date     | Fecha en la que se publicó el anuncio.                     |
