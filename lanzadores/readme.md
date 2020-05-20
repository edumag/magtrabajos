# lanzadores


## Listado

- **buscar_enlaces_rotos**	Comprobar enlaces rotos
- **buscar_sesiones_vim_interrumpidas**	
- **buscar_webshell**	buscamos webshell en el código
- **comprobar_enlaces_rotos**	Comprobación de los enlaces de un dominio web
- **comprobar_web**	Hacer una comprobación para ver si la pagina esta funcionando
- **contrasenya**	Imprimir contraseña de comando 
- **cron_gcm.sh**	Lanzar petición de cron sobre proyecto basado en GCM
- **documentar_css**	Documentar css
- **git-cambios-realizados**	Muestra los cambios realizados desde git.
- **informacion_ip**	Mostrar información sobre una ip o un dominio.
- **liberar_memoria**	Liberar memoria del sistema.
- **permisos_apache**	Cambiar permisos para los proyectos web, para que no den problemas
- **reemplazar_texto**	Reemplazar texto.
- **script2md**	Construir salida markdown en base a la salida de doxygen2help.
- **simular_conexion_lenta**	Forzamos a realentizar la conexión a internet.
- **ultimos_archivos_modificados**	listamos los últimos archivos que han sido modificados
- **ver_querys_lentas_en_mysql**	
- **video2web.sh**	Convertir vídeo a formato web.
- **xdebug_conmutador**	Conmutar xdebug


## Scripts

### buscar_enlaces_rotos

```

 buscar_enlaces_rotos
 Comprobar enlaces rotos
```

### buscar_webshell

```

 buscar_webshell

 buscamos webshell en el código

 Se puede pasar extensión de archivos a buscar, sino
 buscamos en todos.
```

### comprobar_enlaces_rotos

```

 comprobar_enlaces_rotos
 Comprobación de los enlaces de un dominio web

 dependencias: curl, lynx, wget
```

### comprobar_web

```

 comprobar_web
 Hacer una comprobación para ver si la pagina esta funcionando

 Referencia:
 http://www.linuxhispano.net/2013/02/19/monitorizar-servidor-web-para-ver-si-esta-caido-o-no-de-forma-automatica/
```

### contrasenya

```

 contrasenya
 Imprimir contraseña de comando

 Nos permite tener un modo simple de recuperar contraseñas a la hora de lanzar comandos
 sin la necesidad de añadirlas en el mismo código, ganando en seguridad.

 El mecanismo es muy simple, se tiene un archivo con los permisos adecuados ( solo lectura para
 el dueño, chmod 0400 $datos) en la carpeta de usuario con el nombre '.gcm_ctsrc' y con formato 'comando|contraseña'

 @todo Encriptar el archivo para más seguridad
```

### cron_gcm.sh

```

 cron_gcm.sh
 Lanzar petición de cron sobre proyecto basado en GCM
```

### documentar_css

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

### git-cambios-realizados

```

 git-cambios-realizados
 Muestra los cambios realizados desde git.
```

### informacion_ip

```

 informacion_ip
 Mostrar información sobre una ip o un dominio.
```

### liberar_memoria

```

 leberar_memoria
 Liberar memoria del sistema.
```

### permisos_apache

```

 permisos_apache
 Cambiar permisos para los proyectos web, para que no den problemas

 Hacer que el grupo de la carpeta del proyecto sea el nuestro usuario
 y el sueño apache, dar permisos de escritura al grupo

 Si el primer argumento que se pasa es --quitar en vez de dar permisos
 lo que hacemos es quitarlos para el grupo pero mantenemos los de apache
```

### reemplazar_texto

```

 reemplazar_texto
 Reemplazar texto.
```

### script2md

```

 script2md

 Construir salida markdown en base a la salida de doxygen2help.
```

### simular_conexion_lenta

```

 simular_conexion_lenta
 Forzamos a realentizar la conexión a internet.
```

### ultimos_archivos_modificados

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

### ver_querys_lentas_en_mysql

```

 registros

 Para que funcione se debe configurar mysql con las siguientes instrucciones.

  # Here you can see queries with especially long duration
  log_slow_queries        = /var/log/mysql/mysql-slow.log
  long_query_time = 2
  log-queries-not-using-indexes
```

### video2web.sh

```

 video2web
 Convertir vídeo a formato web.
```

### xdebug_conmutador

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

