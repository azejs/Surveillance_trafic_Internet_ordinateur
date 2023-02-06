 #!/usr/bin/bash
#créer "fonction for" qui fait  la récupération les statistiques de trafic de cette interface
interface="ens33"
#creation un dossier netiface
mkdir /tmp/netiface
for ((i=1;i<=60;i++))
do
cat /sys/class/net/$interface/statistics/rx_bytes >>~/Documents/projet/entrant.rx
cat /sys/class/net/$interface/statistics/tx_bytes >>~/Documents/projet/sortant.tx
echo $i >>minutes
sleep 60
done
paste minutes entrant.rx sortant.tx >/tmp/netiface/netiface.sh
#Créer le graphique à l'aide de gnuplot
gnuplot << EOF
  reset
  set terminal png
  set output "/tmp/netiface/netiface.png"
  set xlabel "Temps (minutes)"
  set ylabel "Octets"
  set title "Surveillance du trafic Internet de $interface"
  plot '/tmp/netiface/netiface.sh' using 1:2 with lines title "Octets reçus",'/tmp/netiface/netiface.sh' using 1:3 with lines title "Octets envoyes"
EOF
#créer page netiface html pour afficher image concus via à l’aide du programme Gnuplot
echo "<html>
  <head>
    <title>Trafic réseau sur $interface</title>
    <style type="text/css">

        body{
            background:#ebeaf0;
            width:210mm;
            background: white;
            margin-left: 20% ;
            box-shadow: 0 0 0.5cm rgba(235, 169, 169, 0.5);     
            margin-bottom: 0.5cm;      
            height: 28cm;  
            }
        @media print {   
        body{      
            margin:0px;    
            height: calc(280mm - 25.4mm);  
             }
           }
        h3{
            padding: 1em;
            color: rgb(226, 116, 13);
          }
          .img{
            position:relative;
            padding: 1em;
        }
        </style> 
  </head>
  <body>
     <img src='netiface.png' class="img"/>
      <h3>L’image indique le nombre d’octets reçus et envoyés par minute et couvrira
      maximum 1h de surveillance</h3>
  </body>
</html>" >/tmp/netiface/netiface.html
