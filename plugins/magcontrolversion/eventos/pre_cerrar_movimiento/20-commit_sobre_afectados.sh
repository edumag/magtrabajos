## @file
## @brief Si se utiliza control de versiones en este proyecto hacemos un commit
##        sobre los archivos del movimiento afectados
##
## - Comprobar si se utiliza magcontrolversion es el proyecto.
## - Hacer informe con el perfil 'control_versiones'
## - Ejecutar commit
## - En caso de error al ejecutarlo, lanzar menu de magcontrolversion, dando la 
##   posibilidad de cancelar evento.

source "`dirname "$BASH_SOURCE"`/../../magcontrolversion_funcs"

if [ "`plugin_activado magcontrolversion`" != "" ] ; then 
#if [ -e '.git' ] && [ "$cerrando_tarea" != "SI" ] ; then

   if [ "$movimientoId" != "" ] ; then                                         # Control de versiones sobre movimiento

     echo "Control de versiones sobre movimiento ($movimientoId)"
      echo
      SQL="SELECT r.nombre FROM movimientos m, rMovimientoArchivos r
      WHERE m.id=r.idMovimiento AND m.id=$movimientoId
      ORDER BY r.nombre"
      local ARCHIVOSs=$(ejecutarSQL "$SQL" "-N" )
      ARCHIVOSs=$(echo "$ARCHIVOSs" | sort | uniq )

      if [ "$ARCHIVOSs" != "" ] ; then                                          # Sacar descripción
        SQL="SELECT m.nombre FROM movimientos m
        WHERE m.id=$movimientoId
        "
        local titulo=$(ejecutarSQL "$SQL" "-N" )
        echo $titulo > $TMP
      fi

      echo -e "`color colAviso`"
      cat "$TMP"
      echo -e "`color`"
      echo

      if [ "$ARCHIVOSs" != "" ] ; then

         log "magcontrolversion  texto "$TMP" commit $ARCHIVOSs"

         magcontrolversion  texto "$TMP" commit $ARCHIVOSs

         if [ $? != 0 ] ; then
            echo
            echo Error ejecutando magcontrolversion
            echo
            echo '[C]ancelar | [I]r a magcontrolversion'
            echo
            read -n 1 -s -p "Opciones: " OPCION
            if [ "$OPCION" = "c" ] ; then
               evento_fallido='true'
            else
               magcontrolversion texto "$TMP" menu "$ARCHIVOSs"
            fi
         fi
      else
         mensajes " magcontrolversion::No hay archivos afectados no se hace commit"
      fi

   else

      mensajes ' magcontrolversion::No tenemos movimiento seleccionado'

   fi

fi


