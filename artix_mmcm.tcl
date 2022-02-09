# brute force Artix-7 MMCM frequency divider
# Uses the fractional counter0 out

# fin and desired fout
set fin	    100e6
set fout    24.576e6

# some constraints
set fvcomin 600e6
set fvcomax 1200e6
set fpfdmax 450e6
set fpfdmin 10e6

# found in ug472
set dmin [expr max(1, ceil($fin / $fpfdmax))]
set dmax [expr min(106, floor($fin / $fpfdmin))]
set mmin [expr max(1, ceil($fvcomin / $fin * $dmin))]
set mmax [expr min(64, floor($fvcomax / $fin * $dmax))]

# error threshold %
set et 0.001

set e 999
set d $dmin
while {$d <= $dmax} {
#  puts $d
  set m $mmin
  while {$m <= $mmax} {
#    puts "\t$m"
    set o 1
    while {$o <= 128} {
#      puts "\t\t$o"
      set f [expr $fin * ($m / ($d * $o))]
      if {$f == $fout} { puts "d = $d, m = $m, o = $o"; return }
      set ne [expr abs(($f - $fout) / $fout) * 100]
      if {$ne < $et} { puts "d = $d, m = $m, o = $o"; return }
      if {$ne < $e} {
	set best [list $d $m $o]
	set e $ne
      }
      set o [expr $o + 0.125]
    }
    set m [expr $m + 0.125]
  }
  incr d
}

