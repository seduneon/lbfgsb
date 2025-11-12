module lbfgsb_kinds_module
  use, intrinsic :: iso_fortran_env
  implicit none
  private

  public :: lbfgsb_wp
  public :: debug_kind

!---- select working precision (no per-entity PUBLIC here) ----
#ifdef REAL32
  integer, parameter :: lbfgsb_wp = real32
#elif defined(REAL64)
  integer, parameter :: lbfgsb_wp = real64
#elif defined(REAL80)
  ! 80-bit extended (stored in 16 bytes typically)
  integer, parameter :: lbfgsb_wp = selected_real_kind(18, 4000)
#elif defined(REAL128)
  integer, parameter :: lbfgsb_wp = real128
#else
  integer, parameter :: lbfgsb_wp = real64
#endif

contains

  subroutine debug_kind()
    print *, "# wp kind=", kind(0.0_lbfgsb_wp), &
             " storage=", storage_size(0.0_lbfgsb_wp), &
             " epsilon=", epsilon(1.0_lbfgsb_wp)
#ifdef REAL128
    print *, "# branch: REAL128"
#elif defined(REAL80)
    print *, "# branch: REAL80"
#elif defined(REAL64)
    print *, "# branch: REAL64"
#elif defined(REAL32)
    print *, "# branch: REAL32"
#else
    print *, "# branch: DEFAULT(REAL64)"
#endif
  end subroutine debug_kind

end module lbfgsb_kinds_module
