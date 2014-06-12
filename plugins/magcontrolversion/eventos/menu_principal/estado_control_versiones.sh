## @file estado_control_versiones.sh
## @brief Presentar estado de control de versiones

# Si tenim fitxes bloquejats els presentem
if [ "`plugin_activado magcontrolversion`" != "" ] ; then 
  if [ -d '.git' ] || [ -d '.svn' ] ; then
   local total_cambios="$(magcontrolversion status | wc -l | cut -d' ' -f1)"
   local rama_actual="$(magcontrolversion rama_actual)"
   SALIDA="Rama actual: $rama_actual / Archivos con cambios $total_cambios"
   if [ "$SALIDA" != "" ] ; then
      caja "$SALIDA" 'Control de versiones' $colAviso 0
   fi
  else
    caja 'Debe iniciarse magcontrolversion si deseas utilizarlo' 'Control de versiones' $colAviso 0
  fi
fi

