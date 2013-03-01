## @file lista_bloqueados.sh
## @brief Presentar lista de archivos bloqueados

# Si tenim fitxes bloquejats els presentem
if [ "`plugin_activado ftptrabajo`" != "" ] ; then 
   local total_bloqueados="$(ftptrabajo --consulta --proyecto $proyecto  -tb)"
   if [ $? != 0 ] || [ "$total_bloqueados" ==  "0" ] || [ "$total_bloqueados" = "" ] ; then 
      SALIDA=''
   elif [ "$total_bloqueados" -gt 8 ] ; then 
      SALIDA="Total de archivos bloqueados: $total_bloqueados"
   else
      SALIDA="$(ftptrabajo --proyecto $proyecto  -vb)"
   fi
   if [ "$SALIDA" != "" ] ; then
      caja "$(echo $SALIDA)" 'Archivos bloqueados' $colAviso 0
   fi
fi
