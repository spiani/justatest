FC=gfortran
FFLAGS=-O0
OBJ=hello.f90

%.o: %.f90
	$(FC) $(FFLAGS) -o $@ -c $<

hello: $(OBJ)
	$(FC) $(FFLAGS) -o $@ $(OBJ)

clean:
	@rm -f *.mod *.o hello

check: hello
	./hello | diff tests/reference_file -
