C     Functions that deal with the bin grid.

      module mod_bin
      contains

CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC

      subroutine make_bin_grid(n_bin, scal, v_min, bin_v, bin_r,
     $     dlnr)

      integer n_bin        ! INPUT: number of bins
      integer scal         ! INPUT: scale factor
      real*8 v_min         ! INPUT: minimum volume (m^3)
      real*8 bin_v(n_bin)  ! OUTPUT: volume of particles in bins (m^3)
      real*8 bin_r(n_bin)  ! OUTPUT: radius of particles in bins (m)
      real*8 dlnr          ! OUTPUT: scale factor

      integer i
      real*8 ax

      real*8 pi
      parameter (pi = 3.14159265358979323846d0)

      dlnr = dlog(2d0) / (3d0 * dble(scal))
      ax = 2d0**(1d0 / dble(scal)) ! ratio bin_v(i)/bin_v(i-1)

      do i = 1,n_bin
         ! volume (m^3)
         bin_v(i) = v_min * 0.5d0 * (ax + 1d0) * ax**(i - 1)
         ! radius (m)
         bin_r(i) = dexp(dlog(3d0 * bin_v(i) / 
     &             (4d0 * pi)) / 3d0)
      enddo

      end subroutine

CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC

      subroutine bin_edge(n_bin, bin_v, i, v_edge)

      integer n_bin             ! INPUT: number of bins
      real*8 bin_v(n_bin)       ! INPUT: volume of particles in bins (m^3)
      integer i                 ! INPUT: edge number (1 <= i <= n_bin + 1)
      real*8 v_edge             ! OUTPUT: volume at edge

      if (i .eq. 1) then
         v_edge = bin_v(1) - (bin_v(2) - bin_v(1)) / 2d0
      elseif (i .eq. (n_bin + 1)) then
         v_edge = bin_v(n_bin) + (bin_v(n_bin) - bin_v(n_bin - 1)) / 2d0
      else
         v_edge = (bin_v(i - 1) + bin_v(i)) / 2d0
      endif

      end subroutine

CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC

      subroutine particle_in_bin(v, n_bin, bin_v, k)
      ! FIXME: for log-spaced bins we can do this without search

      real*8 v             ! INPUT: volume of particle
      integer n_bin        ! INPUT: number of bins
      real*8 bin_v(n_bin)  ! INPUT: volume of particles in bins (m^3)
      integer k            ! OUTPUT: bin number containing particle

      k = 0
 300  k = k + 1
      if ((k .lt. n_bin) .and.
     &     (v .gt. (bin_v(k) + bin_v(k+1)) / 2d0)) goto 300

      return
      end subroutine

CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC

      subroutine bin_n_to_g(n_bin, bin_v, bin_n, bin_g)

      integer n_bin             ! INPUT: number of bins
      real*8 bin_v(n_bin)       ! INPUT: volume of particles in bins (m^3)
      integer bin_n(n_bin)      ! INPUT: number in bins
      real*8 bin_g(n_bin)       ! OUTPUT: mass in bins

      integer i

      do i = 1,n_bin
         bin_g(i) = dble(bin_n(i)) * bin_v(i)
      enddo

      end subroutine

CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC

      subroutine est_k_max_for_bin(n_bin, bin_v, kernel, b1, b2, k_max)

      integer n_bin             ! INPUT: number of bins
      real*8 bin_v(n_bin)       ! INPUT: volume of particles in bins (m^3)
      integer b1                ! INPUT: first bin
      integer b2                ! INPUT: second bin
      real*8 k_max              ! OUTPUT: maximum kernel values

      interface
         subroutine kernel(v1, v2, k)
         real*8, intent(in) :: v1
         real*8, intent(in) :: v2
         real*8, intent(out) :: k
         end subroutine
      end interface

      real*8 v1, v2, v1_high, v1_low, v2_high, v2_low, k
      integer i, j

      integer n_sample
      parameter (n_sample = 10)  ! number of sample points per bin

      ! v1_low < bin_v(b1) < v1_high
      call bin_edge(n_bin, bin_v, b1, v1_low)
      call bin_edge(n_bin, bin_v, b1 + 1, v1_high)

      ! v2_low < bin_v(b2) < v2_high
      call bin_edge(n_bin, bin_v, b2, v2_low)
      call bin_edge(n_bin, bin_v, b2 + 1, v2_high)

      k_max = 0d0
      do i = 1,n_sample
         do j = 1,n_sample
            v1 = v1_high * dble(n_sample - i) / dble(n_sample - 1) +
     $           v1_low * dble(i - 1) / dble(n_sample - 1)
            v2 = v2_high * dble(n_sample - j) / dble(n_sample - 1) +
     $           v2_low * dble(j - 1) / dble(n_sample - 1)
            call kernel(v1, v2, k)
            if (k .gt. k_max) k_max = k
         enddo
      enddo

      return
      end subroutine

CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC

      subroutine est_k_max_binned(n_bin, bin_v, kernel, k_max)

      integer n_bin             ! INPUT: number of bins
      real*8 bin_v(n_bin)       ! INPUT: volume of particles in bins (m^3)
      real*8 k_max(n_bin,n_bin) ! OUTPUT: maximum kernel values

      interface
         subroutine kernel(v1, v2, k)
         real*8, intent(in) :: v1
         real*8, intent(in) :: v2
         real*8, intent(out) :: k
         end subroutine
      end interface

      integer i, j

      do i = 1,n_bin
         do j = 1,n_bin
            call est_k_max_for_bin(n_bin, bin_v, kernel, i, j,
     &           k_max(i,j))
         enddo
      enddo

      return
      end subroutine

CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC

      end module
