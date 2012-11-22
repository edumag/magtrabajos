## @file comprobar_bloqueo.sh
## @brief Comprobar bloqueos de archivos a editar

echo
echo Comprobar si lo tenemos bloqueado
echo ---------------------------------
echo
BLOQ=''
for n in `seq 0 ${#aSALIDA[*]}` ; do
   x="`echo ${aSALIDA[$n]} | sed "s/'//g"`"
   if [ "$x" != "" ] ; then
      echo -n "- $x "
      if [ "`ftptrabajo --proyecto $proyecto -vb | grep ^${x}$ `" = "" ] ; then
         BLOQ="$BLOQ $x"
         echo "[ko]"
      else
         echo "[ok]"
      fi
   fi
done

if [ "$BLOQ" != "" ] ; then
   echo
   echo "Hay archivos sin bloquear"
   echo "-------------------------"
   echo
   echo -e "¿Quieres bajarlos del servidor? (s/n): \c "
   read OPCION
   if [ "$OPCION" = 's' ] ; then
      ftptrabajo --proyecto $proyecto  -b $BLOQ
   fi

fi

