## @file 20-subversion.sh
## @brief Hacer commit sobre movimientos afectados en movimiento

source "`dirname "$BASH_SOURCE"`/../../magcontrolversion_funcs"
# Si se utiliza control de versiones en este proyecto hacemos un commit sobre los archivos del movimiento afectados

if [ -e '.svn' ] && [ "$cerrando_tarea" != "SI" ] ; then

   if [ "$movimientoId" != "" ] ; then                                         # Control de versiones sobre movimiento

      echo "Control de versiones sobre movimiento"
      echo
      SQL="SELECT r.nombre FROM movimientos m, rMovimientoArchivos r
      WHERE m.id=r.idMovimiento AND m.id=$movimientoId
      ORDER BY r.nombre"
      local ARCHIVOSs=$(ejecutarSQL "$SQL" "-N" )
      ARCHIVOSs=$(echo "$ARCHIVOSs" | sort | uniq )

      if [ "$ARCHIVOSs" != "" ] ; then                                          # Sacar descripción
         informe_subversion
      fi

      echo -e "$salida"
      echo

      if [ "$ARCHIVOSs" != "" ] ; then
         CMD="svn ci $ARCHIVOSs -F $TMP" ; eval $CMD
         salida=$(eval $CMD 2>&1)
         if [ $? != 0 ] ; then
            echo -e "\nError ejecutando comando: $CMD\n"
            echo " $salida"
            echo
            echo '[C]ancelar | [I]r a magcontrolversion'
            echo
            read -n 1 -s -p "Opciones: " OPCION
            if [ "$OPCION" = "c" ] ; then
               evento_fallido='true'
            else
               magcontrolversion texto "$TMP" menu "$ARCHIVOSs"
            fi
            echo
         fi
         svn update  # Actualizamos codigo con servidor
      else
         mensajes " magcontrolversion::No hay archivos afectados no se hace commit"
      fi

   else

      mensajes ' magcontrolversion::No tenemos movimiento seleccionado'

   fi

fi


