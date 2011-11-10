# Common setting for boxes graph
##################################

# set type of output on EPS
set terminal postscript eps color enhanced


# set style of graph
set style data histogram
set style histogram cluster gap 1
#set boxwidth 1.0 absolute
set style fill solid 0.5 noborder


# set color of lines
set style line 1 lt rgb "#006400"
set style line 2 lt rgb "#00008B"
set style line 3 lt rgb "#8B0000"
set style line 4 lt rgb "#B8860B"
set style line 5 lt rgb "#696969"


# add y-grip
set grid ytics


# remove legend
set nokey


# add edges
#set offset 1,1,0,0


# remove top-xtics
set xtics nomirror