program test_kiss

  use kiss_random_number_generator
  implicit none

  !integer,parameter :: I8=selected_int_kind(18)
  !integer,parameter :: R8=selected_real_kind(18,18)
  !integer(I8)  :: Q(20632)
  !integer(I8)  :: I8_max = huge(Q(1))
  !integer(I8)  :: I8_min = -(huge(Q(1)) + 1)
  !integer(I8)  :: I8_range = 2*huge(Q(1)) + 1
  integer(I8)  :: x
  integer(I8)  :: i
  
  do i=1_I8,20632_I8 !fill Q with Congruential+Xorshift
    xcng=xcng*6906969069_I8+123_I8
    xs=ieor(xs,ishft(xs,13_I8))
    xs=ieor(xs,ishft(xs,-17_I8))
    xs=ieor(xs,ishft(xs,43_I8))
    Q(i)=xcng+xs
  end do
  
  open(unit=8,file="kiss64_sequence_prog.txt")

  do i=1,1000000000_I8
    x=kiss64_rng()
    write(8,fmt="(i21,2x,i21)") i, x
  end do

  close(unit=8)

  write(*,10) x
  10 format(' Does x = 4013566000157423768 ?',/,6x,'x = ',I20)

  open(unit=8,file="kiss64_uniform.txt")

  do i=1,100000
    write(8,fmt="(F16.14)") kiss64_uniform_rng()
!    print *, kiss64_rng()
  end do

end program test_kiss