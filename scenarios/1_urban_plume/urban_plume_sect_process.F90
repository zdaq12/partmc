!> This program will process the data from a sectional urban plume simulation

!> Read NetCDF output files and process them.

program process

  use pmc_output
  use pmc_stats
  use pmc_scenario
  use pmc_aero_binned

  character(len=PMC_MAX_FILENAME_LEN), parameter :: prefix &
= "out/sect_urban_plume_Zhang"

  character(len=PMC_MAX_FILENAME_LEN) :: in_filename, out_filename
  type(bin_grid_t) :: bin_grid
  type(aero_data_t) :: aero_data
  type(aero_binned_t) :: aero_binned
  type(gas_data_t) :: gas_data
  type(gas_state_t) :: gas_state
  type(env_state_t) :: env_state
  type(scenario_t) :: scenario
  integer :: ncid, index, i_index, dimid, i, i_bin
  real(kind=dp) :: time, del_t, tot_num_conc, tot_mass_conc, vol
  character(len=PMC_UUID_LEN) :: uuid
  real(kind=dp), allocatable :: times(:), num_concs(:), v_d(:), rates(:)
  
  type(stats_1d_t) :: stats_num_concs, stats_tot_num_conc, stats_tot_mass_conc, &
      stats_v_d, stats_rates

  call pmc_mpi_init()

  allocate(times(7))

  do i_index = 1,7
    call make_filename(in_filename, prefix, ".nc", i_index)
    write(*,*) "Processing " // trim(in_filename)
    call input_sectional(in_filename, index, time, del_t, uuid, bin_grid=bin_grid, &
        aero_data=aero_data, aero_binned=aero_binned, gas_data=gas_data, &
        gas_state=gas_state, env_state=env_state, scenario=scenario)

    times(i_index) = time

    num_concs = aero_binned%num_conc * bin_grid%widths
    tot_num_conc = sum(num_concs)

    tot_mass_conc = sum(aero_binned%vol_conc(:,1) * bin_grid%widths) * aero_data%density(1)
  
    call stats_1d_add_entry(stats_tot_num_conc, tot_num_conc, i_index)
    call stats_1d_add_entry(stats_tot_mass_conc, tot_mass_conc, i_index)

    call stats_1d_add(stats_num_concs, num_concs)

    call make_filename(out_filename, prefix, "_process.nc", index)
    write(*,*) "Writing " // trim(out_filename)
    call pmc_nc_open_write(out_filename, ncid)
    call pmc_nc_write_info(ncid, uuid, "1_urban_plume sectional process")
    call env_state_output_netcdf(env_state, ncid)
    call aero_data_output_netcdf(aero_data, ncid)
    call aero_binned_output_netcdf(aero_binned, ncid, bin_grid, aero_data)

    call stats_1d_output_netcdf(stats_num_concs, ncid, "num concs. per bin", &
      dim_name="diam", unit="m^{-3}")

    if (i_index == 1) then
      allocate(v_d(size(bin_grid%centers)))
      do i=1,bin_grid_size(bin_grid)
        vol = aero_data_rad2vol(aero_data, bin_grid%centers(i))
        v_d(i) = scenario_loss_rate_dry_dep(scenario, vol, aero_data%density(1), &
        aero_data, env_state) * env_state%height
      end do

      call stats_1d_add(stats_v_d, v_d)
      call stats_1d_output_netcdf(stats_v_d, ncid, "v_d", dim_name='diam', &
        unit="m s^{-1}")
      allocate(rates(size(bin_grid%centers)))
      call scenario_section_dry_dep_rates(scenario, bin_grid, aero_data, env_state, &
        rates)
      call stats_1d_add(stats_rates, rates)
      call stats_1d_output_netcdf(stats_rates, ncid, "drydep_rates", dim_name='diam', &
        unit="s^{-1}")
    end if

    call stats_1d_clear(stats_num_concs)

    call pmc_nc_close(ncid) 
  end do

  call make_filename(out_filename, prefix, "_process.nc")
  write(*,*) "Writing " // trim(out_filename)
  call pmc_nc_open_write(out_filename, ncid)
  call pmc_nc_write_info(ncid, uuid, "1_urban_plume sectional process")
  call pmc_nc_write_real_1d(ncid, times, "time", dim_name="time", unit="s")
  call stats_1d_output_netcdf(stats_tot_num_conc, ncid, "tot_num_conc", &
      dim_name="time", unit="m^{-3}")
  call stats_1d_output_netcdf(stats_tot_mass_conc, ncid, "tot_mass_conc", &
      dim_name="time", unit="kg m^{-3}")
  call pmc_nc_close(ncid)

  call pmc_mpi_finalize()

end program process