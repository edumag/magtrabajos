plugins Plugins

Para extender la aplicación.

Para que un plugin este activado debe estar en la lista de @see mt_plugins_activados, 
dentro de la configuración del proyecto.

@section estructura_plugins Estructura del directorio

<pre>
magcontrolversion/
|-- eventos
|   |-- pre_cerrar_movimiento
|   |   `-- 20-subversion.sh
|   `-- pre_cerrar_tarea
|       `-- 10-subversion.sh
|-- extension.sh
|-- magcontrolversion
`-- menu.sh
</pre>

@section eventos Eventos

Al ejecutarse un evento se buscara dentro de la carpeta de cada plugin si contiene un 
script para ser ejecutado se tendrá en cuenta el orden según el nombre del script

@section extensiones_plugin Extensiones para los plugins

El archivo extension.sh es una porción de código que sera incluido dentro de la aplicación 
al arrancar con source. 

@section menu_plugins Menú para los plugins

El archivo menu.sh si se encuentra se mostrará en la lista de componentes para ser incluido 
con source al ser seleccionada.

