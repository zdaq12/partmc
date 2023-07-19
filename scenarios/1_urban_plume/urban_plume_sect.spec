run_type sectional                   # sectional (binned) run
output_prefix out/sect_urban_plume   # prefix of output files

t_max 3600                           # total simulation time (s)
del_t 60                             # timestep (s)
t_output 600                         # output interval (0 disables) (s)
t_progress 0                         # progress printing interval (0 disables) (s)

n_bin 1000                           # number of bins
d_min 2e-9                           # minimum diameter (m)
d_max 1e-2                           # maximum diameter (m)

gas_data gas_data.dat                # file containing gas data
aerosol_data sect_aero_data.dat      # file containing aerosol data
do_fractal no                        # whether to do fractal treatment 
aerosol_init aero_init_dist.dat      # aerosol initial condition file

temp_profile temp.dat                # temperature profile file
pressure_profile pres.dat            # pressure profile file
height_profile height.dat            # height profile file
gas_emissions gas_emit.dat           # gas emissions file
gas_background gas_back.dat          # background gas concentrations file
aero_emissions aero_emit.dat         # aerosol emissions file
aero_background aero_back.dat        # aerosol background file
loss_function drydep                 # loss function specification
drydep_param Zhang_2001              # dry deposition parameterization (Zhang_2001 or Emerson_2020)

rel_humidity 0.95                    # initial relative humidity (1)
latitude 0                           # latitude (degrees, -90 to 90)
longitude 0                          # longitude (degrees, -180 to 180)
altitude 0                           # altitude (m)
start_time 21600                     # start time (s since 00:00 UTC)
start_day 200                        # start day of year (UTC)

do_coagulation yes                   # whether to do coagulation (yes/no)
coag_kernel zero                     # coagulation kernel