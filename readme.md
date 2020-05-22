# MagTrabajos

IDE de programación generado en bash

![Pantalla de inicio](https://raw.githubusercontent.com/edumag/magtrabajos/master/docs/img/pantalla_inicio_magtrabajos.png)

## Configuración

La configuración sigue una jerarquía desde la configuración global hasta la de 
cada proyecto individual.

- Primero cargamos $HOME/.magtrabajos/configuracion/*
- Después .magtrabajos/configuracion/*

En cada una de estas carpetas puede añadirse configuración para el mismo magtrabajos
o para alguno de sus componentes o plugins que utiliza.

Ejemplo en buscar_codigo:

### Si tenemos configuración de usuario la recogemos


```
[[ -e "$HOME/.magtrabajos/configuracion/$programa" ]] && source "$HOME/.magtrabajos/configuracion/$programa"
```

### Si tenemos configuración de proyecto la recogemos

```
[[ -e ".magtrabajos/configuracion/$programa" ]] && source "$HOME/.magtrabajos/configuracion/$programa"
```

## lanzadores Lanzadores al inicio

Si encontramos ".magtrabajos/lanzadores" el archivo lo añadimos
al iniciar el programa. Para automatizar el lanzamiento de aplicaciones que abrimos
al trabajar en el proyecto.

Ejemplos:

## Si hay sesión de vim anterior la abrimos y la borramos 

```
[[ -e Session.vim ]] && ( gvim -S Session.vim ; sleep 2s ; rm -f Session.vim )
```

## Lanzamos firefox con pagina del proyecto en local

```
$mt_navegador $mt_web_local &
```


## Contenido

- [**/config**](#config)	Configuración básica para cualquier script que estemos utilizando
- [**/magtrabajos**](#magtrabajos)	Gestión de tareas para programadores
- [**/componentes/buscar_codigo/buscar_codigo**](#buscar_codigo)	Buscar palabras seleccionadas en el código
- [**/libash/configuracion**](#configuracion)	Librería para gestionar la configuración de los scripts de bash
- [**/libash/doxygen2help**](#doxygen2help)	Extraer de la documentación en la cabecera de los scripts la ayuda a presentar en consola
- [**/libash/elegirArchivo**](#elegirArchivo)	librería para seleccionar archivos
- [**/libash/general**](#general)	Funciones genericas para los scripts en bash
- [**/libash/listado**](#listado)	listado es una librería que podemos insertar en nuestros scripts que nos permite generar menús 
- [**/libash/mysql2rst**](#mysql2rst)	Librería para bash para transformar una consulta a mysql a una tabla valida para rst
- [**/libash/pantalla**](#pantalla)	Librería para mejorar la salida por pantalla
- [**/magtidy/magtidy**](#magtidy)	Interface para tidy
- [**/mail2rst/mail2rst**](#mail2rst)	Transformar email en rst
- [**/mDocumentos/mDocumentos**](#mDocumentos)	Manejador de documentos adjuntos de proyectos
- [**/extensiones/mc_con_ftp**](#mc_con_ftp)	Lanzar mc con dirección ftp del proyecto
- [**/lanzadores/buscar_enlaces_rotos**](#buscar_enlaces_rotos)	Comprobar enlaces rotos
- [**/lanzadores/buscar_webshell**](#buscar_webshell)	buscamos webshell en el código
- [**/lanzadores/comprobar_enlaces_rotos**](#comprobar_enlaces_rotos)	Comprobación de los enlaces de un dominio web
- [**/lanzadores/comprobar_web**](#comprobar_web)	Hacer una comprobación para ver si la pagina esta funcionando
- [**/lanzadores/contrasenya**](#contrasenya)	Imprimir contraseña de comando 
- [**/lanzadores/cron_gcm.sh**](#cron_gcm.sh)	Lanzar petición de cron sobre proyecto basado en GCM
- [**/lanzadores/documentar_css**](#documentar_css)	Documentar css
- [**/lanzadores/git-cambios-realizados**](#git-cambios-realizados)	Muestra los cambios realizados desde git.
- [**/lanzadores/informacion_ip**](#informacion_ip)	Mostrar información sobre una ip o un dominio.
- [**/lanzadores/liberar_memoria**](#liberar_memoria)	Liberar memoria del sistema.
- [**/lanzadores/permisos_apache**](#permisos_apache)	Cambiar permisos para los proyectos web, para que no den problemas
- [**/lanzadores/reemplazar_texto**](#reemplazar_texto)	Reemplazar texto.
- [**/lanzadores/script2md**](#script2md)	Construir salida markdown en base a la salida de doxygen2help.
- [**/lanzadores/simular_conexion_lenta**](#simular_conexion_lenta)	Forzamos a realentizar la conexión a internet.
- [**/lanzadores/ultimos_archivos_modificados**](#ultimos_archivos_modificados)	listamos los últimos archivos que han sido modificados
- [**/lanzadores/video2web.sh**](#video2web.sh)	Convertir vídeo a formato web.
- [**/lanzadores/xdebug_conmutador**](#xdebug_conmutador)	Conmutar xdebug
- [**/plugins/ftptrabajo/ftptrabajo**](#ftptrabajo)	Programa de ftp para trabajar en grupo.
- [**/magbackup/magbackup**](#magbackup)	magbackup es un script para generar copias de seguridad.
- [**/magcontrolversion/magcontrolversion**](#magcontrolversion)	manejando control de versiones
- [**/motores/maggit**](#maggit)	manejando control de versiones con git
- [**/motores/magsvn**](#magsvn)	manejando control de versiones con subversion
- [**/magcscope/magcscope**](#magcscope)	Lanzar cscope con los datos del proyecto
- [**/magdoxygen/magdoxygen**](#magdoxygen)	Interface para doxygen
- [**/magraficas/magraficas**](#magraficas)	Creación de graficas
- [**/magtestunit/magtestunit**](#magtestunit)	Interface para phpUnit

## Scripts

<a name="config"/>

### /config

```

 config
 Configuración básica para cualquier script que estemos utilizando

 @defgroup configuracion Configuración

 Añadir con source a cualquier script que se utilice, nos automatiza:

 - Tener disponible las variables:

   + DIR_CONF_USUARIO: Directorio con las configuraciones del usuario

   + DIR_MAGTRABAJOS: Directorio de magtrabajos

   + DIR_PROYECTO: Directorio del proyecto actual

   + DIR_TMP: Directorio temporal

   + parte_dir: Contenido de la dirección que debemos sustituir por localhost
                si queremos tener la url local.

   + DIR_PROGRAMA: Directorio del script actual

   + PROGRAMA: Nombre del script actual.

 - Añadir librerías de libash
   Por defecto nos añade la general y configuracion, pero podemos antes de llamarlo indicar más
   librerías a incluir mediante LIBS="pantalla" por ejemplo.

 - Si estamos en un componente o pluging buscara su configuración por defecto en
   su directorio con nombre config.default y la del usuarios si la hay.

 @todo Aplicar este sistema a todos los sripts de magtrabajos

 @{
```

<a name="magtrabajos"/>

### /magtrabajos

```

 magtrabajos
 Gestión de tareas para programadores
 @mainpage magTrabajos

 Conjunto de scripts realizados en bash para facilitar y agilizar la programación desde linux.
 .
    - Administración de tareas
    - control de tiempo de trabajo
    - facturación
    - Control de versiones con subversión
    - Informes varios
    - Búsquedas en código
    - ftp con control de bloqueo.
    - etc...

 Dependencias: gvim, mysql, pdflatex, python-docutils iconv colrm

 Sugerencias: lftp, svn, cscope, doxygen mailtextbody

 Uso: magtrabajos [opciones]

 Sin opciones muestra menú de proyectos

 Opciones:

 --menu                                         Presentar menú
 --configurar                                   Configurar proyecto
 --adjuntar                                     Adjuntar documento externo
 --dependencias                                 Comprobar dependencias.
 --proyecto|-p                                  Proyecto.
 --tarea|-t                                     Tarea.
 --movimiento|-m                                Movimiento.
 --añadir-archivo|-a                            Añadir archivos afectados a un movimiento
 --nuevo|-n                                     Nuevo proyecto, tarea o movimiento.
 --movimientos-abiertos|-ma                     Ver movimientos que estan abiertos.
 --tiempos-abiertos|-ta                         Buscar tiempos abiertos
 --accion [Accion]                              Seleccionamos una acción a realizar
 --listar-acciones                              Presentar lista de posibles acciones
 --factura [Nun Factura]                        Seleccionaremos tareas por la factura
 --seleccionar-factura                          Listar facturas para seleccionar
 --consulta                                     Indicamos que solo queremos hacer una comprobación, esto hará que nos
                                                salga la información por pantalla.
 --editar-archivos                              Editar archivos afectados de movimiento, necesita el movimiento
 --seleccionar-tareas '[criterio] [parametro]'  Seleccionar tareas por diferentes criterios
 --informe                                      Tipo de informe
 --listar-informes                              Listar los posibles informes
 --exportar [Formato] [Archivo rst]             Si no se indica formato muestra menú, formatos posibles:
                                                [H]tml,[E]mail,Email h[t]ml,[P]df,[l]ess,[I]mprimir,[c]sv
                                                Si no se indica archivo rst se recoge el temporal con el último
                                                informe realizado
 --editar | -e                                  Editar archivos
 --estado-subversion                            Presentar estado de subversion de proyecto
 --archivos                                     imprimir lista de archivos para poder ser procesada con otro comando, ejemplo:
 --borrar_archivo_lista_afectados               Borrar archivos afectados de un movimiento, sino se especifican archivos nos permite seleccionar
                                                magtrabajos -m 1343 --archivos | xargs ls -l
 --nueva-tarea-email                            Crear tarea nueva desde un archivo de email pasado como argumento.
 --lanzar                                       Nos presenta listados para permitirnos seleccionar por diferentes
                                                criterios, últimos movimientos, etc...

 --terminal                                     Lanza una terminal con magtrabajos y los parametros a continuación de --terminal
 --sesiones_abiertas|-sa                        Comprobar si tenemos sesiones abiertas, magtrabajos -sa ; echo $? devolverá 0 en caso de no haya o 1 si hay
 --listar-plugins                               Lista de puglins instalados
 --log                                          Ver registro del programa
 --help|-h                                      Esta misma ayuda
 --help-configuracion                           Presentar configuración
 --help-seleccionar-tareas                      Presentar ayuda para la selección de tareas
 --depurar                                      Muestra por pantalla mucha información sobre el programa, por defecto no


 @author   Eduardo Magrané
 @internal
       web  http://www.lesolivex.com

      mail  edu.lesolivex.com

   Created  13/03/11

  Revision  SVN $Id: $

 Copyright  Copyright (c) 2011, Eduardo Magrané

 This source code is released for free distribution under the terms of the
 GNU General Public License as published by the Free Software Foundation.
```

<a name="buscar_codigo"/>

### buscar_codigo/buscar_codigo

```

 buscar_codigo

 Buscar palabras seleccionadas en el código

 Podemos enviar la lista a vim como si se tratara de una lista de errores para hacer
 su seguimiento

 Uso: buscar_codigo [opciones] [archivos o directorios seleccionados]

 Opciones:

 buscar [palabra a buscar]   Palabra a buscar dentro del código
 formato [formato]           Por defecto txt una lista de las lineas encontradas
                             que podremos incluir en vim, otros posibles: rst, enlaces.
 menu                        Presentar menú
 encoding_entrada [encoding] Especificar encoding de archivos de entrada, por defecto
                             utf-8
 encoding_salida [encoding]  Encoding de salida, por defecto utf-8
 servidor_vim [servername]   Nombre del servidor vim al que enviar la lista con el resultado
 debug                       Muestra mensajes de programa
 help                        Pantalla de ayuda


 En caso de no seleccionar ninguna ubicación se entenderá que se quiere buscar en el directorio
 actual.

 Para modificar el encoding se utiliza iconv, con iconv -l tendremos una lista de posibles
 encodings

 @author   Eduardo Magrané
 @internal
       web  http://www.lesolivex.com

      mail  edu.lesolivex.com

   Created  13/03/11

  Revision  SVN $Id: $

 Copyright  Copyright (c) 2011, Eduardo Magrané

 This source code is released for free distribution under the terms of the
 GNU General Public License as published by the Free Software Foundation.
```

<a name="configuracion"/>

### libash/configuracion

```

 configuracion

 Librería para gestionar la configuración de los scripts de bash

 Para trabajar con esta librería es necesario que tengamos un archivo de configuración definido,
 y sus variables deben tener un prefijo que las identifique.

 También es necesario una descripción de cada variable que se define con formato de doxygen, puede
 estar en el mismo archivo del script, y pasarselo como archivo que contiene las descripciones. En
 caso de no tenerla pondremos el nombre de la variable

 ejemplo:
 @code
 ## @var miprograma_titulo
 ## Define el titulo que deseas
 miprograma_titulo='HOLA'
 @endcode

 Podemos definir un archivo con las variables por defecto, este archivo deberá contener el prefijo
 de las variables más _default, ejemplo: mt_default_teminal="xterm", si al definir una configuración
 le damos como valor default, a la hora de leer la configuración se recogerá el valor establecido en
 el archivo de las variables por defecto.

 Si tenemos un archivo con variables por defecto, este sera el que manda sobre los otros, la idea es
 que si el archivo por defecto a variado y ahora una variable deja de usarse, al editarse la
 configuración ya no mostrara esta variable, manteniendo limpios los ficheros de configuración.

 @ingroup libash, configuracion

 @author   Eduardo Magrané

 @internal

       web  http://www.lesolivex.com

      mail  edu.lesolivex.com

   Created  13/03/11

  Revision  SVN $Id: $

 Copyright  Copyright (c) 2011, Eduardo Magrané

 This source code is released for free distribution under the terms of the
 GNU General Public License as published by the Free Software Foundation.
```

<a name="doxygen2help"/>

### libash/doxygen2help

```

 doxygen2help

 Extraer de la documentación en la cabecera de los scripts la ayuda a presentar en consola

 Puede ser utilizado como librería o como comando externo, doxygen2help [archivo]

 @ingroup libash

 @author   Eduardo Magrané
 @namespace componenteslibash
 @internal
       web  http://www.lesolivex.com

      mail  edu.lesolivex.com

   Created  13/03/11

  Revision  SVN $Id: $

 Copyright  Copyright (c) 2011, Eduardo Magrané

 This source code is released for free distribution under the terms of the
 GNU General Public License as published by the Free Software Foundation.
```

<a name="elegirArchivo"/>

### libash/elegirArchivo

```

 elegirArchivo

 librería para seleccionar archivos

 Para utilizar esta librería hay que insertarla haciendo un source
 tienes un ejemplo un poco abajo de como utilizar una librería externa de bash
 con la librería de pantalla.

 Una vez insertada la librería solo tienes que llamar a la función elegirArchivo.

 Si se cancela la operación el array e_archivos_seleccionados devolvera 'CANCELADO' para poder diferenciar
 si e ha deseleccionado archivos o simplemente se ha cancelado y no se quiere cambiar nada.

 Seleccionar un archivo

 Se puede pasar como argumento el directorio donde queremos empezar a buscar.

 Cada archivo se presenta con el numero correspondiente para seleccionarlo

 Se puede utilizar rangos; ejemplo: 2-6 ( del 2 al 6) o listas 3 6 8 12 34.

 parámetros posibles desde consola:

    --filtro [patrón]     Solo se presentan archivos que coincidan con el patrón.
    --dudir               Presentar tamaño de archivos.
    --accion [Comando]    lanzar comando sobre archivos seleccionados.
    --subir               Permite ir mas aya del directorio de inicio.
    --dusel               Se presentan tamaño de archivos seleccionados y su total.
    --cols [columnas]     Numero de columnas, por defecto 3.
    --fichero             Para seleccionar un archivo (Por defecto).
    --varios              Para seleccionar mas de un archivo. (Por defecto)
    --dir                 Nos permite seleccionar un directorio, pero también podemos devolver archivos.
    --dirinicio           Nos permite pasar el directorio de inicio para después poder eliminarlo del nombre del archivo
    --nombres-absolutos   Recoger los nombres con la dirección absoluta y no la relativa.
    --excluir             Lista de patrones de archivos que queremos ocultar, separada por '|', ej. ('*.LCK|*.swf|session.vim')
    --titulo              Titulo para presentar en la cabecera

 @todo Si solo tenemos un archivo y el directorio es el de inicio, se selecciona directamente.

 @ingroup libash

 @author   Eduardo Magrané

 @internal

       web  http://www.lesolivex.com

      mail  edu.lesolivex.com

  Revision  SVN $Id: $

 Copyright  Copyright (c) 2011, Eduardo Magrané

 This source code is released for free distribution under the terms of the
 GNU General Public License as published by the Free Software Foundation.
```

<a name="general"/>

### libash/general

```

 general

 Funciones genericas para los scripts en bash

 @defgroup libash Librerías para bash
 @{

 @author   Eduardo Magrané

 @internal

       web  http://www.lesolivex.com

      mail  edu.lesolivex.com

   Created  13/03/11

  Revision  SVN $Id: $

 Copyright  Copyright (c) 2011, Eduardo Magrané

 This source code is released for free distribution under the terms of the
 GNU General Public License as published by the Free Software Foundation.
```

<a name="listado"/>

### libash/listado

```

 listado

 listado es una librería que podemos insertar en nuestros scripts que nos permite generar menús
 de listas donde podremos seleccionar diferentes elementos.

 Recibe una lista de elementos en la cual podremos especificar columnas en formato:
 @code
 126tnombretdescripción de la linea, los campos son separados por "t".
 @endcode
 la primera columna sera el identificador único que diferenciara una linea de otra.

 Almacenaremos en la variable global resultado_listado el contenido separando un item
 de otro por un espacio.

 Se puede pasar el argumento -o para que se oculte los identificadores, (primera columna)
 @code
 uso:
    source listado
    generar_listado [opciones] lineas a mostrar con sus campos separados por t
    echo Seleccionado: $resultado_listado

 opciones:

 -h                   Ayuda
 -o                   Ocultar el primer campo
 --ocultar-ayuda      Ocultar la nota explicativa al usuario
 -t  [titulo]         Titulo a mostrar en el listado
 @endcode

 ejemplo de uso:

 source listado
 @code
 generar_listado -t 'Titulo listado de ejemplo' -o '127tprimer ejemplotCon su descripción' ## '208tSegundo ejemplotSefunda descripción' ## '2tTercer ejemplotTercera descripción'

 echo "Resultado: $resultado_listado"

 cd $HOME
 generar_listado -t $HOME/*

 echo "Resultado: $resultado_listado"
 @endcode

 @ingroup libash

 @author   Eduardo Magrané
 @namespace componenteslibash

 @todo Unir en una misma función generar_listado y generar_listado_fichero
 @bug Se presenta segunda columna de listados anteriores, hay que hacer limpieza

 @internal

       web  http://www.lesolivex.com

      mail  edu.lesolivex.com

  Revision  SVN $Id: $

 Copyright  Copyright (c) 2011, Eduardo Magrané

 This source code is released for free distribution under the terms of the
 GNU General Public License as published by the Free Software Foundation.
```

<a name="mysql2rst"/>

### libash/mysql2rst

```

 mysql2rst

 Librería para bash para transformar una consulta a mysql a una tabla valida para rst

 Este programa esta sujeto a la licencia GNU/GPL.

 En esta página podeis encontrar una traducción en castellano
 http://gugs.sindominio.net/licencias/gples.html

 y aquí la versión original http://www.gnu.org/licenses/gpl-3.0.html

 Uso:

 mysql2rst [Opciones] [Parametros para mysql]

 Opciones:

 -h        Ayuda
 -N        Para tener cabeceras en la tabla
 -e        "sql a ejecutar"

 Ejemplo: mysql2rst -e '$sql' trabajos

 @author   Eduardo Magrané

 @ingroup libash

 @internal

       web  http://www.lesolivex.com

      mail  edu.lesolivex.com

  Revision  SVN $Id: $

 Copyright  Copyright (c) 2011, Eduardo Magrané

 This source code is released for free distribution under the terms of the
 GNU General Public License as published by the Free Software Foundation.
```

<a name="pantalla"/>

### libash/pantalla

```

 pantalla

 Librería para mejorar la salida por pantalla

 @ingroup libash

 @author   Eduardo Magrané

 @internal

       web  http://www.lesolivex.com

      mail  edu.lesolivex.com

   Created  13/03/11

  Revision  SVN $Id: $

 Copyright  Copyright (c) 2011, Eduardo Magrané

 This source code is released for free distribution under the terms of the
 GNU General Public License as published by the Free Software Foundation.
```

<a name="magtidy"/>

### magtidy/magtidy

```

 magtidy
 Interface para tidy

 magtidy nos permite validar un archivo html.

 Uso: magtidy [opción] [archivos seleccionados]

 Opciones:

 ejecutar                 Ejecutar tidy sobre directorio actual
 ver                      Mostrar salida generada por tidy.
 verErrores               Ver fichero de errores
 errores2vim              Enviar lista de errores a vim
 debug                    Depurar script.
 menu                     Menú


 @author   Eduardo Magrané
 @internal
       web  http://www.lesolivex.com

      mail  edu.lesolivex.com

   Created  13/03/11

  Revision  SVN $Id: $

 Copyright  Copyright (c) 2011, Eduardo Magrané

 This source code is released for free distribution under the terms of the
 GNU General Public License as published by the Free Software Foundation.
```

<a name="mail2rst"/>

### mail2rst/mail2rst

```

 mail2rst
 Transformar email en rst

 @todo Quitar cabecera de emails
```

<a name="mDocumentos"/>

### mDocumentos/mDocumentos

```

 mDocumentos

 Manejador de documentos adjuntos de proyectos

  Uso: `basename $0` -p [proyecto] [opciones] [archivos]

  Opciones:

  -p Nombre de proyecto
  -i Insertar documentos
  -l Listar documentos

 @todo Implementar la relación entre movimiento y adjuntos
 @todo Configurar comando que abre los documentos
```

<a name="mc_con_ftp"/>

### extensiones/mc_con_ftp

```

 mc_con_ftp
 Lanzar mc con dirección ftp del proyecto
```

<a name="buscar_enlaces_rotos"/>

### lanzadores/buscar_enlaces_rotos

```

 buscar_enlaces_rotos
 Comprobar enlaces rotos
```

<a name="buscar_webshell"/>

### lanzadores/buscar_webshell

```

 buscar_webshell

 buscamos webshell en el código

 Se puede pasar extensión de archivos a buscar, sino
 buscamos en todos.
```

<a name="comprobar_enlaces_rotos"/>

### lanzadores/comprobar_enlaces_rotos

```

 comprobar_enlaces_rotos
 Comprobación de los enlaces de un dominio web

 dependencias: curl, lynx, wget
```

<a name="comprobar_web"/>

### lanzadores/comprobar_web

```

 comprobar_web
 Hacer una comprobación para ver si la pagina esta funcionando

 Referencia:
 http://www.linuxhispano.net/2013/02/19/monitorizar-servidor-web-para-ver-si-esta-caido-o-no-de-forma-automatica/
```

<a name="contrasenya"/>

### lanzadores/contrasenya

```

 contrasenya
 Imprimir contraseña de comando

 Nos permite tener un modo simple de recuperar contraseñas a la hora de lanzar comandos
 sin la necesidad de añadirlas en el mismo código, ganando en seguridad.

 El mecanismo es muy simple, se tiene un archivo con los permisos adecuados ( solo lectura para
 el dueño, chmod 0400 $datos) en la carpeta de usuario con el nombre '.gcm_ctsrc' y con formato 'comando|contraseña'

 @todo Encriptar el archivo para más seguridad
```

<a name="cron_gcm.sh"/>

### lanzadores/cron_gcm.sh

```

 cron_gcm.sh
 Lanzar petición de cron sobre proyecto basado en GCM
```

<a name="documentar_css"/>

### lanzadores/documentar_css

```

 documentar_css
 Documentar css

 Podemos documentarnos sobre como generar la documentación desde
 http://jacobrask.github.io/styledocco/

 Instalar:

 sudo apt-get install nodejs nodejs-legacy
 sudo apt-get install npm
 npm install -fg styledocco
```

<a name="git-cambios-realizados"/>

### lanzadores/git-cambios-realizados

```

 git-cambios-realizados
 Muestra los cambios realizados desde git.
```

<a name="informacion_ip"/>

### lanzadores/informacion_ip

```

 informacion_ip
 Mostrar información sobre una ip o un dominio.
```

<a name="liberar_memoria"/>

### lanzadores/liberar_memoria

```

 leberar_memoria
 Liberar memoria del sistema.
```

<a name="permisos_apache"/>

### lanzadores/permisos_apache

```

 permisos_apache
 Cambiar permisos para los proyectos web, para que no den problemas

 Hacer que el grupo de la carpeta del proyecto sea el nuestro usuario
 y el sueño apache, dar permisos de escritura al grupo

 Si el primer argumento que se pasa es --quitar en vez de dar permisos
 lo que hacemos es quitarlos para el grupo pero mantenemos los de apache
```

<a name="reemplazar_texto"/>

### lanzadores/reemplazar_texto

```

 reemplazar_texto
 Reemplazar texto.
```

<a name="script2md"/>

### lanzadores/script2md

```

 script2md

 Construir salida markdown en base a la salida de doxygen2help.
```

<a name="simular_conexion_lenta"/>

### lanzadores/simular_conexion_lenta

```

 simular_conexion_lenta
 Forzamos a realentizar la conexión a internet.
```

<a name="ultimos_archivos_modificados"/>

### lanzadores/ultimos_archivos_modificados

```

 ultimos_archivos_modificados

 listamos los últimos archivos que han sido modificados

 Por defecto se muestran los archivos modificados en las últimas 24 horas
 del directorio actual.

 Opciones:

 --help | -h              Pantalla de ayuda


 @author   Eduardo Magrané

 @internal

       web  http://www.lesolivex.com

      mail  edu.lesolivex.com

  Revision  SVN $Id: $

 Copyright  Copyright (c) 2011, Eduardo Magrané

 This source code is released for free distribution under the terms of the
 GNU General Public License as published by the Free Software Foundation.
```

<a name="video2web.sh"/>

### lanzadores/video2web.sh

```

 video2web
 Convertir vídeo a formato web.
```

<a name="xdebug_conmutador"/>

### lanzadores/xdebug_conmutador

```

 xdebug_conmutador
 Conmutar xdebug

 Uso: xdebug_conmutador [on|off]

    Se debe tener en la carpeta $dir_prog los archivos $on y $off para activar o desactivar xdebug.

 @author   Eduardo Magrané

 @internal

       web  http://www.lesolivex.com

      mail  edu.lesolivex.com

  Revision  SVN $Id: $

 Copyright  Copyright (c) 2011, Eduardo Magrané

 This source code is released for free distribution under the terms of the
 GNU General Public License as published by the Free Software Foundation.
```

<a name="ftptrabajo"/>

### ftptrabajo/ftptrabajo

```

 ftptrabajo

 Programa de ftp para trabajar en grupo.

 Características del programa

 Con este programa podemos trabajar en grupo, cada vez que trabajamos sobre un archivo crea una marca en el
 servidor para que no pueda ser escrito ese archivo hasta que el programador acabe su trabajo y vuelva a subir
 la nueva versión.

 Es compatible con el sistema de bloqueos que utiliza dreamweaver.

 dependencias: cut ftp lftp diff

 uso de $prog [opción] [fichero]:

 Parámetros:


  --proyecto | -p [proyecto]              Proyecto seleccionado
  --configurar                            Configurar proyecto de la carpeta actual
  --comando | -c [comando]                Lanzar comando
  -a                                      Añadir archivo a la lista de bloqueados, pendientes de subir.
  --subir, -s                             Sube un archivo al servidor quitando el bloqueo que
                                          hayamos puesto anteriormente.
  --bajar, -b                             Baja un archivo y coloca el bloqueo en el servidor.
  --listar                                Lista contenido de directorio especificado.
  --subir-bloqueados, -sb                 Sube de una tacada todos los archivos que hemos ido acumulando y
                                          tenemos bloqueados en el servidor.
  --sincronizar                           Bajamos los archivos del servidor que hayan cambiado
  --sincronizar-servidor                  Subimos los archivos de local que hayan cambiado al servidor
  --borrar [archivo]                      Borrar archivo del servidor.
  --cambiar-nombre [origen] [destino]     Cambiar nombre de archivo.
  --nuevo [archivo o directorio]          Subir archivo o directorio de local a remoto, solo funciona en el caso
                                          de que no exista en remoto.
  --log-ftp                               Terminal con el registro de ftp.
  --log                                   Terminal con registro del programa.
  --ver-bloqueados, -vb                   Imprime lista de los archivos que tenemos bloqueados.
  --total-bloqueados, -tb                 Imprime total de los archivos que tenemos bloqueados.

  --forzar-bajar, -fb                     Obtener archivo del servidor.
  --forzar-subir, -fs                     Sube un archivo sin tener en cuenta los bloqueos

  -elb                                    Editar lista bloqueados
  -edd                                    Editar lista de directorios descartados en la sincronización.

  --bajar-bloqueos                        Actualizar archivos bloqueados de servidor con local.
  --ver-bloqueados                        Ver los archivos bloqueados
  --ver-bloqueos-local                    Ver los archivos de bloqueo en local

  --lista-externa                         Recibimos archivo que contiene lista de archivos

  --menu                                  Menú de aplicación.

  --depurar                                 Mostramos mensajes de depuración
  --help, -h                              Imprime esta ayuda.
  -info                                   Información extendida.



 Dependencias: cut, ftp, lftp, diff

 @author   Eduardo Magrané

 @todo Con sftp no borra los ficheros de bloqueo ya que no entiende delete y ftp no entiende rm

 @internal

       web  http://www.lesolivex.com

      mail  edu.lesolivex.com

 Copyright  Copyright (c) 2011, Eduardo Magrané

 This source code is released for free distribution under the terms of the
 GNU General Public License as published by the Free Software Foundation.
```

<a name="magbackup"/>

### magbackup/magbackup

```

 magbackup
 magbackup es un script para generar copias de seguridad.

 Con los ficheros creamos una copia por mes y a partir de esta vamos creando
 archivos por cada día de la semana con los cambios desde la copia por mes.

 Para generar las copias se debe crear un fichero de perfil en la carpeta
 ~/.config/magscripts/magbackup/ficheros/perfil el nombre de la copia que se
 genera se basa en el nombre del archivo de perfil su formato es:

 CS_DIR="/home/eduardo/"
 CS_COPIAR="Scripts .bashrc"

 CS_DIR: Nos indica la carpeta donde situarnos
 CS_COPIAR: Las subcarpetas o archivos que deseamos copiar

 En caso de una copia de mysql en CS_DIR debera añadirse mysql <user> <password> y en
 CS_COPIAR los nombres de las bases de datos a copiar.

 En el caso de las copias de mysql no hay la posibilidad de copias incrementales con lo
 cual se generara una copia completa cada vez.

 @todo Si pasamos un archivo o directorio creamos archivo comprimido
 @todo Copias para mysql
 @todo Copias para git

 @author   Eduardo Magrané
 @internal
       web  http://www.lesolivex.com

      mail  edu.lesolivex.com

   Created  13/03/11

  Revision  SVN $Id: $

 Copyright  Copyright (c) 2011, Eduardo Magrané

 This source code is released for free distribution under the terms of the
 GNU General Public License as published by the Free Software Foundation.
```

<a name="magcontrolversion"/>

### magcontrolversion/magcontrolversion

```

 magcontrolversion
 @bug No se puede generar release
 manejando control de versiones

  'uso: magcontrolversion [opción] [Archivos o directorios afectados]'

  Opciones:

    commit                    Hacer commit sobre archivos afectados
    todo                      Hacer commit sobre todos los archivos
    update                    Actualizamos
    status                    Ver estado actual
    menu                      Presentamos menú
    borrar                    Borramos archivo, necesitamos archivos como parámetros
    mover                     Mover archivo, necesitamos archivos como parámetros. [origen] [destino]
    nuevos                    Añadir archivos recientemente creados a control de versiones
    quitar                    Eliminar de control de versiones los archivos que han sido borrados localmente
    rama_actual               Nos imprime el nombre de la rama actual y sale.
    cambiar_rama [rama]       Cambiar de rama, necesita nombre de rama a cambiar
    renombrar_rama            Renombrar rama
    sanear [cadena]           Nos devuelve la cadena pasada saneada
    help                      Pantalla de ayuda

 Dependencias: gawk, subversion o git

 @todo Comprobar permisos de escritura para ahorrarnos problemas
 @todo Al ejecutar subversión permitir editar la descripción

 @author   Eduardo Magrané
 @internal
       web  http://www.lesolivex.com

      mail  edu.lesolivex.com

   Created  13/03/11

  Revision  SVN $Id: $

 Copyright  Copyright (c) 2011, Eduardo Magrané

 This source code is released for free distribution under the terms of the
 GNU General Public License as published by the Free Software Foundation.
```

<a name="maggit"/>

### motores/maggit

```

 maggit
 manejando control de versiones con git

 La metodología que utilizamos esta basada en git-flow
 http://sysvar.net/es/entendiendo-git-flow/
```

<a name="magsvn"/>

### motores/magsvn

```

 magsvn
 manejando control de versiones con subversion
```

<a name="magcscope"/>

### magcscope/magcscope

```

 magcscope
 Lanzar cscope con los datos del proyecto

 @todo generar configuración al vuelo y para el proyecto

 @author   Eduardo Magrané

 @internal

       web  http://www.lesolivex.com

      mail  edu.lesolivex.com

  Revision  SVN $Id: $

 Copyright  Copyright (c) 2011, Eduardo Magrané

 This source code is released for free distribution under the terms of the
 GNU General Public License as published by the Free Software Foundation.
```

<a name="magdoxygen"/>

### magdoxygen/magdoxygen

```

 magdoxygen
 Interface para doxygen

 Magdoxygen nos permite documentar un proyecto al vuelo, creando la documentación generada en
 la carpeta temporal.

 Documentar de forma temporal carpetas o archivos seleccionados, evitando la espera de una
 documentación completa del proyecto para ver un resultado concreto.

 También nos permite enviar la salida generada al servidor de vim como lista de errores.

 --filtra bash Si se pide filtro lo aplicamos y salimos, el único filtro que tenemos actualmente
          es para los archivos bash

 Ejemplo de documentación con bash:

 - bloque

 ## Descripción corta
 ##
 ## Descripción larga que
 ## llega hasta aquí

 - Tras la variable

 variable=hola; ##< Variable


 Uso: magdoxygen [opción] [archivos seleccionados]

 A falta de una lista de archivos a documentar se recoge el directorio actual,
 si es que no se pasa un archivo de configuración para doxygen

 Opciones:

 ejecutar                 Ejecutar doxygen sobre directorio actual
 ver                      Ver documentación generada por doxygen
 verErrores               Ver fichero de errores
 configurar               Configurar
 ejecutar_archivos [pdf]  Ejecutar doxygen unicamente sobre archivos recibidos,
                          Opcionalmente podemos pedir el resultado en pdf.
 ver_temporal             Ver resultado temporal
 errores2vim              Enviar lista de errores a vim
 filtrar                  Generamos filtro que nos permite documentar los script de bash
 conf [fich]              Fichero de configuración
 menu                     Menú


 @todo Configuración a sistema de magtrabajos

 @author   Eduardo Magrané
 @internal
       web  http://www.lesolivex.com

      mail  edu.lesolivex.com

   Created  13/03/11

  Revision  SVN $Id: $

 Copyright  Copyright (c) 2011, Eduardo Magrané

 This source code is released for free distribution under the terms of the
 GNU General Public License as published by the Free Software Foundation.
```

<a name="magraficas"/>

### magraficas/magraficas

```

 magraficas
 Creación de graficas

 Dependencias: ploticus

 Uso: echo $datos | magraficas --titulo "Titulo de la grafica" --pie "Pie de la grafica" --plantilla bola

 Parametros:

 --titulo -t     Título de la gráfica
 --pie -p        Pie a colocar en la gráfica
 --plantilla -pl Plantilla a utlizar

 Los parámetros siguientes serán los datos de la gráfica

 Cada plantilla tiene sus propias formas de recibir los datos, leer la
 información de la plantilla para conocerlos.
```

<a name="magtestunit"/>

### magtestunit/magtestunit

```

 magtestunit
 Interface para phpUnit

 Este programa esta sujeto a la licencia GNU/GPL.

 En esta página podeis encontrar una traducción en castellano
 http://gugs.sindominio.net/licencias/gples.html

 y aquí la versión original http://www.gnu.org/licenses/gpl-3.0.html
```

