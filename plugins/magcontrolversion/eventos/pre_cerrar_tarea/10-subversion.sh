## @file 10-subversion.sh
## @brief Al cerrar tarea hacemos commit

source "`dirname "$BASH_SOURCE"`/../../magcontrolversion_funcs"
# Si se utiliza control de versiones en este proyecto hacemos un commit sobre los archivos afectados de la tarea

if [ "`plugin_activado magcontrolversion`" != "" ] ; then 

   if [ "$tareaId" != "" ] ; then                                               # Control de versiones sobre tarea

      echo 'Control de versiones sobre tarea'
      echo

      modificaciones=`magcontrolversion status | wc -l`

      if [ "$modificaciones" == "0" ] ; then
         echo "No hay modificaciones en proyecto"
         echo
         return
      else

         SQL="SELECT r.nombre FROM tareas t, movimientos m, rMovimientoArchivos r
         WHERE m.idTarea=t.id AND m.id=r.idMovimiento AND t.id=$tareaId
         ORDER BY r.nombre"
         local ARCHIVOSs=$(ejecutarSQL "$SQL" "-N" )
         ARCHIVOSs=$(echo "$ARCHIVOSs" | sort | uniq )
         if [ "$ARCHIVOSs" != "" ] ; then                                          # Sacar descripción
            echo
            echo Informe para control de versiones
            echo
            echo "$linea"
            echo -e "`color colDestacado`"
            informe_subversion
            echo -e "`color`"
            echo "$linea"
            magcontrolversion texto "$TMP" menu "$ARCHIVOSs"

            if [ $? != 0 ] ; then 
               evento_fallido='true'
            fi
         fi

      fi

   else
      mensajes ' magcontrolversion::No tenemos tarea ni movimiento seleccionado'
   fi

fi


