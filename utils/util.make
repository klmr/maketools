keep = $(foreach i,$2,$(if $(findstring $1,$i),$i))
drop = $(foreach i,$2,$(if $(findstring $1,$i),,$i))

# vim: ft=make
