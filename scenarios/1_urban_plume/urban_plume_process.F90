! Copyright (C) 2009-2013, 2016, 2017, 2021 Matthew West
! Licensed under the GNU General Public License version 2 or (at your
! option) any later version. See the file COPYING for details.

!> \file
!> The process program.

!> Read NetCDF output files and process them.
program process

  use pmc_output
  use pmc_stats

  character(len=PMC_MAX_FILENAME_LEN), parameter :: prefix &
       = "out/no_emiss_dep_big_part_urban_plume"

  character(len=PMC_MAX_FILENAME_LEN) :: in_filename, out_filename
  type(bin_grid_t) :: diam_grid, bc_grid, sc_grid, oc_grid
  type(aero_data_t) :: aero_data
  type(aero_state_t) :: aero_state
  type(gas_data_t) :: gas_data
  type(gas_state_t) :: gas_state
  type(env_state_t) :: env_state
  integer :: ncid, index, repeat, i_index, i_repeat, n_index, n_repeat, i_gas
  real(kind=dp) :: time, del_t, tot_num_conc, tot_mass_conc
  real(kind=dp) :: d_alpha, d_gamma, chi
  real(kind=dp) :: total_vol, no3_mass_conc, nh4_mass_conc, so4_mass_conc, &
       bc_mass_conc, total_mass, O3_mix_ratio, NO2_mix_ratio, &
       HNO3_mix_ratio, SO2_mix_ratio, NH3_mix_ratio, HCHO_mix_ratio
  character(len=PMC_UUID_LEN) :: uuid
  real(kind=dp), allocatable :: times(:), dry_diameters(:), num_concs(:), &
       dry_masses(:), masses(:), bc_masses(:), bc_fracs(:), &
       oc_masses(:), oc_fracs(:), &
       crit_rhs(:), scs(:), num_dist(:), mass_dist(:), &
       diam_bc_dist(:,:), diam_sc_dist(:,:), diam_oc_dist(:,:)
  type(stats_1d_t) :: stats_num_dist, stats_d_alpha, stats_tot_num_conc, &
       stats_tot_mass_conc, stats_d_gamma, stats_chi, stats_no3_mass_conc, &
       stats_nh4_mass_conc, stats_so4_mass_conc, stats_bc_mass_conc, stats_total_vol, &
       stats_total_mass, stats_O3_mix_ratio, stats_NO2_mix_ratio, stats_HNO3_mix_ratio, &
       stats_SO2_mix_ratio, stats_NH3_mix_ratio, stats_HCHO_mix_ratio, stats_mass_dist
  type(stats_2d_t) :: stats_diam_bc_dist, stats_diam_sc_dist, stats_diam_oc_dist
  character(len=AERO_NAME_LEN), allocatable :: mixing_state_groups(:,:)

  call pmc_mpi_init()

  call input_n_files(prefix, n_repeat, n_index)

  call bin_grid_make(diam_grid, BIN_GRID_TYPE_LOG, 180, 1d-9, 1d-3)
!   call bin_grid_make(oc_grid, BIN_GRID_TYPE_LINEAR, 50, 0d0, 1d0)
!   call bin_grid_make(bc_grid, BIN_GRID_TYPE_LINEAR, 50, 0d0, 1d0)
!   call bin_grid_make(sc_grid, BIN_GRID_TYPE_LOG, 50, 1d-4, 1d0)

  allocate(times(n_index))

!   allocate(mixing_state_groups(3, 4)) ! 3 groups, max 4 species per group
!   mixing_state_groups(1,:) = ["OC    ", "BC    ", "      ", "      "]
!   mixing_state_groups(2,:) = ["API1  ", "API2  ", "LIM1  ", "LIM2  "]
!   mixing_state_groups(3,:) = ["SO4   ", "NO3   ", "NH4   ", "      "]

!   scs = [ real(kind=dp) :: ] ! silence compiler warnings
!   bc_fracs = [ real(kind=dp) :: ]
!   oc_fracs = [ real(kind=dp) :: ]

  do i_index = 1,n_index
     do i_repeat = 1,n_repeat
        call make_filename(in_filename, prefix, ".nc", i_index, i_repeat)
        write(*,*) "Processing " // trim(in_filename)
        ! FIXME: add UUID check into input_state(), keyed off of index or
        ! time or something? Or init to "" and check if not this.
        call input_state(in_filename, index, time, del_t, repeat, &
             uuid, aero_data=aero_data, aero_state=aero_state, &
             gas_data=gas_data, gas_state=gas_state, env_state=env_state)

        times(i_index) = time

        dry_diameters = aero_state_diameters(aero_state, aero_data)
        num_concs = aero_state_num_concs(aero_state, aero_data)
        num_dist = bin_grid_histogram_1d(diam_grid, dry_diameters, num_concs)
        call stats_1d_add(stats_num_dist, num_dist)

        tot_num_conc = sum(num_concs)
        call stats_1d_add_entry(stats_tot_num_conc, tot_num_conc, i_index)

        masses = aero_state_masses(aero_state, aero_data)
        tot_mass_conc = sum(masses * num_concs)
        call stats_1d_add_entry(stats_tot_mass_conc, tot_mass_conc, i_index)

        mass_dist = bin_grid_histogram_1d(diam_grid, dry_diameters, (masses * num_concs))
        call stats_1d_add(stats_mass_dist, mass_dist)

        dry_masses = aero_state_masses(aero_state, aero_data)
     !    bc_masses = aero_state_masses(aero_state, aero_data, &
     !         include=(/"BC"/))
     !    bc_fracs = bc_masses / dry_masses
     !    diam_bc_dist = bin_grid_histogram_2d(diam_grid, dry_diameters, &
     !         bc_grid, bc_fracs, num_concs)
     !    call stats_2d_add(stats_diam_bc_dist, diam_bc_dist)

        ! ADDED
     !    oc_masses = aero_state_masses(aero_state, aero_data, &
     !         include=(/"OC"/))
     !    oc_fracs = oc_masses / dry_masses
     !    diam_oc_dist = bin_grid_histogram_2d(diam_grid, dry_diameters, &
     !         oc_grid, oc_fracs, num_concs)
     !    call stats_2d_add(stats_diam_oc_dist, diam_oc_dist)

     !    ! Mass concentrations of aerosol species
     !    no3_mass_conc = sum(aero_state_masses(aero_state, aero_data, &
     !         include=(/"NO3"/)) * num_concs)
     !    nh4_mass_conc = sum(aero_state_masses(aero_state, aero_data, &
     !         include=(/"NH4"/)) * num_concs)
     !    so4_mass_conc = sum(aero_state_masses(aero_state, aero_data, &
     !         include=(/"SO4"/)) * num_concs)
     !    bc_mass_conc = sum(bc_masses * num_concs)

        O3_mix_ratio = gas_state%mix_rat(gas_data_spec_by_name(gas_data, "O3"))
        NO2_mix_ratio = gas_state%mix_rat(gas_data_spec_by_name(gas_data, "NO2"))
        HNO3_mix_ratio = gas_state%mix_rat(gas_data_spec_by_name(gas_data, "HNO3"))
        HCHO_mix_ratio = gas_state%mix_rat(gas_data_spec_by_name(gas_data, "HCHO"))
        SO2_mix_ratio = gas_state%mix_rat(gas_data_spec_by_name(gas_data, "SO2"))
        NH3_mix_ratio = gas_state%mix_rat(gas_data_spec_by_name(gas_data, "NH3"))

        total_vol = sum(aero_state_volumes(aero_state, aero_data))
        total_mass = sum(aero_state_masses(aero_state, aero_data))

        call stats_1d_add_entry(stats_total_vol, total_vol, i_index)
        call stats_1d_add_entry(stats_total_mass, total_mass, i_index)

     !    call stats_1d_add_entry(stats_no3_mass_conc, no3_mass_conc, i_index)
     !    call stats_1d_add_entry(stats_nh4_mass_conc, nh4_mass_conc, i_index)
     !    call stats_1d_add_entry(stats_so4_mass_conc, so4_mass_conc, i_index)
     !    call stats_1d_add_entry(stats_bc_mass_conc, bc_mass_conc, i_index)

        call stats_1d_add_entry(stats_O3_mix_ratio, O3_mix_ratio, i_index)
        call stats_1d_add_entry(stats_NO2_mix_ratio, NO2_mix_ratio, i_index)
        call stats_1d_add_entry(stats_HNO3_mix_ratio, HNO3_mix_ratio, i_index)
        call stats_1d_add_entry(stats_HCHO_mix_ratio, HCHO_mix_ratio, i_index)
        call stats_1d_add_entry(stats_SO2_mix_ratio, SO2_mix_ratio, i_index)
        call stats_1d_add_entry(stats_NH3_mix_ratio, NH3_mix_ratio, i_index)
        
     !    crit_rhs = aero_state_crit_rel_humids(aero_state, aero_data, &
     !         env_state)
     !    scs = crit_rhs - 1d0
     !    diam_sc_dist = bin_grid_histogram_2d(diam_grid, dry_diameters, &
     !         sc_grid, scs, num_concs)
     !    call stats_2d_add(stats_diam_sc_dist, diam_sc_dist)

     !    call aero_state_mixing_state_metrics(aero_state, aero_data, &
     !         d_alpha, d_gamma, chi, groups=mixing_state_groups)

     !    call stats_1d_add_entry(stats_d_alpha, d_alpha, i_index)
     !    call stats_1d_add_entry(stats_d_gamma, d_gamma, i_index)
     !    call stats_1d_add_entry(stats_chi, chi, i_index)

     end do

     call make_filename(out_filename, prefix, "_process.nc", index)
     write(*,*) "Writing " // trim(out_filename)
     call pmc_nc_open_write(out_filename, ncid)
     call pmc_nc_write_info(ncid, uuid, "1_urban_plume process")
     call bin_grid_output_netcdf(diam_grid, ncid, "diam", unit="m")
     ! call bin_grid_output_netcdf(bc_grid, ncid, "bc_frac", unit="1")
     ! call bin_grid_output_netcdf(oc_grid, ncid, "oc_frac", unit="1")
     ! call bin_grid_output_netcdf(sc_grid, ncid, "sc", unit="1")

     call stats_1d_output_netcdf(stats_num_dist, ncid, "num_dist", &
          dim_name="diam", unit="m^{-3}")
     call stats_1d_clear(stats_num_dist)

     call stats_1d_output_netcdf(stats_mass_dist, ncid, "mass_dist", &
          dim_name="time", unit="kg m^{-3}")
     call stats_1d_clear(stats_mass_dist)

     ! call stats_2d_output_netcdf(stats_diam_bc_dist, ncid, "diam_bc_dist", &
     !      dim_name_1="diam", dim_name_2="bc_frac", unit="m^{-3}")
     ! call stats_2d_clear(stats_diam_bc_dist)

     ! call stats_2d_output_netcdf(stats_diam_oc_dist, ncid, "diam_oc_dist", &
     !      dim_name_1="diam", dim_name_2="oc_frac", unit="m^{-3}")
     ! call stats_2d_clear(stats_diam_oc_dist)

     ! call stats_2d_output_netcdf(stats_diam_sc_dist, ncid, "diam_sc_dist", &
     !      dim_name_1="diam", dim_name_2="sc", unit="m^{-3}")
     ! call stats_2d_clear(stats_diam_sc_dist)

     call pmc_nc_close(ncid)
  end do

  call make_filename(out_filename, prefix, "_process.nc")
  write(*,*) "Writing " // trim(out_filename)
  call pmc_nc_open_write(out_filename, ncid)
  call pmc_nc_write_info(ncid, uuid, "1_urban_plume process")
  call pmc_nc_write_real_1d(ncid, times, "time", dim_name="time", unit="s")
  call stats_1d_output_netcdf(stats_tot_num_conc, ncid, "tot_num_conc", &
       dim_name="time", unit="m^{-3}")
  call stats_1d_output_netcdf(stats_tot_mass_conc, ncid, "tot_mass_conc", &
       dim_name="time", unit="kg m^{-3}")

!   call stats_1d_output_netcdf(stats_no3_mass_conc, ncid, "no3_mass_conc", &
!        dim_name="time", unit="kg m^{-3}")

!   call stats_1d_output_netcdf(stats_nh4_mass_conc, ncid, "nh4_mass_conc", &
!        dim_name="time", unit="kg m^{-3}")

!   call stats_1d_output_netcdf(stats_so4_mass_conc, ncid, "so4_mass_conc", &
!        dim_name="time", unit="kg m^{-3}")

!   call stats_1d_output_netcdf(stats_bc_mass_conc, ncid, "bc_mass_conc", &
!        dim_name="time", unit="kg m^{-3}")

  call stats_1d_output_netcdf(stats_total_vol, ncid, "total_vol", &
       dim_name="time", unit="m^{-3}")

  call stats_1d_output_netcdf(stats_total_mass, ncid, "total_mass", &
       dim_name="time", unit="kg")

  call stats_1d_output_netcdf(stats_O3_mix_ratio, ncid, "O3_mix_ratio", &
       dim_name="time", unit="ppb")

  call stats_1d_output_netcdf(stats_NO2_mix_ratio, ncid, "NO2_mix_ratio", &
       dim_name="time", unit="ppb")

  call stats_1d_output_netcdf(stats_HNO3_mix_ratio, ncid, "HNO3_mix_ratio", &
       dim_name="time", unit="ppb")

  call stats_1d_output_netcdf(stats_HCHO_mix_ratio, ncid, "HCHO_mix_ratio", &
       dim_name="time", unit="ppb")

  call stats_1d_output_netcdf(stats_SO2_mix_ratio, ncid, "SO2_mix_ratio", &
       dim_name="time", unit="ppb")

  call stats_1d_output_netcdf(stats_NH3_mix_ratio, ncid, "NH3_mix_ratio", &
       dim_name="time", unit="ppb")

!   call stats_1d_output_netcdf(stats_d_alpha, ncid, "d_alpha", &
!        dim_name="time", unit="1")
!   call stats_1d_output_netcdf(stats_d_gamma, ncid, &
!        "d_gamma", dim_name="time", unit="1")
!   call stats_1d_output_netcdf(stats_chi, ncid, "chi", &
!        dim_name="time", unit="1")
!   call pmc_nc_close(ncid)

  call pmc_mpi_finalize()

end program process

