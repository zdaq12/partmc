CDF       
      gas_species       aero_species      aero_source       	aero_diam      d   aero_diam_edges    e         title          PartMC version 2.6.1 output file   source        PartMC version 2.6.1   UUID      $D1A106C4-1470-4D3D-A1AF-8BC6F00F9003   history       =2023-01-18T10:51:15.777-06:00 created by PartMC version 2.6.1      Conventions       CF-1.4            time             unit      s      description       #time elapsed since simulation start         �   timestep             unit      s      description       current timestep size           �   timestep_index               description       Jan integer that is 1 on the first timestep, 2 on the second timestep, etc.          �   temperature              unit      K      standard_name         air_temperature         �   relative_humidity                unit      1      standard_name         relative_humidity           �   pressure             unit      Pa     standard_name         air_pressure           	longitude                unit      degree_east    standard_name         	longitude              latitude             unit      degree_north   standard_name         latitude           altitude             unit      m      standard_name         altitude           start_time_of_day                unit      s      description       9time-of-day of simulation start in seconds since midnight           $   start_day_of_year                description       &day-of-year number of simulation start          ,   elapsed_time             unit      s      description       #elapsed time since simulation start         0   solar_zenith_angle               unit      radian     description       (current angle from the zenith to the sun        8   height               unit      m      	long_name         boundary layer mixing height        @   gas_species                 names         H2SO4,HNO3,HCl,NH3,NO,NO2      description       tdummy dimension variable (no useful value) - read species names as comma-separated values from the 'names' attribute        H   gas_mosaic_index                	long_name         MOSAIC indices of gas species           `   gas_mixing_ratio                unit      ppb    	long_name         mixing ratios of gas species      0  x   aero_species               names         H2O    description       tdummy dimension variable (no useful value) - read species names as comma-separated values from the 'names' attribute        �   aero_source                names         init   description       sdummy dimension variable (no useful value) - read source names as comma-separated values from the 'names' attribute         �   aero_mosaic_index                  	long_name         !MOSAIC indices of aerosol species           �   aero_density               unit      kg/m^3     	long_name         densities of aerosol species        �   aero_num_ions                  	long_name         4number of ions after dissociation of aerosol species        �   aero_molec_weight                  unit      kg/mol     	long_name         $molecular weights of aerosol species        �   
aero_kappa                 unit      1      	long_name         5hygroscopicity parameters (kappas) of aerosol species           �   fractal_dimension                unit      1      description       !particle volume fractal dimension           �   fractal_prime_radius             unit      m      description       radius of primary particles         �   fractal_vol_fill_factor              unit      1      description       volume filling factor           �   	aero_diam                  unit      m      	long_name         aerosol diameter grid centers      description       �logarithmically spaced centers of aerosol diameter grid, so that aero_diam(i) is the geometric mean of aero_diam_edges(i) and aero_diam_edges(i + 1)        �   aero_diam_edges                unit      m      	long_name         aerosol diameter grid edges    description       Ulogarithmically spaced edges of aerosol diameter grid, with one more edge than center        (     aero_diam_widths               unit      1      	long_name         aerosol diameter grid widths   description       ~base-e logarithmic widths of aerosol diameter grid, with aero_diam_widths(i) = ln(aero_diam_edges(i + 1) / aero_diam_edges(i))          0   aero_number_concentration                  unit      1/m^3      	long_name         .aerosol number size concentration distribution     description       �logarithmic number size concentration, d N(r)/d ln D --- multiply by aero_diam_widths(i) and sum over i to compute the total number concentration           P   aero_mass_concentration                   unit      kg/m^3     	long_name         ,aerosol mass size concentration distribution   description       �logarithmic mass size concentration per species, d M(r,s)/d ln D --- multiply by aero_diam_widths(i) and sum over i to compute the total mass concentration of species s        "p@r�     @r�        @r      ?�����+@�j             @D                         @r�             @�@                                                                                                   @�@         ?�n��O�;        @      >Ey��0�:?�      >}�d���>��([�>��)�Q>��-��u=>����4>�H�g��%>�"-�,>�z���H�>�i#�K'B>��<�R\>�:|�M�>�j�?�Mu>�)��6�9>��&��(>�]��B>�gz�5/�>�����>�*h��>�����Y>�p�.��#>���ߤ�>�Փ/@(>χ�m3>҅S�vS�>��0�>ِ�C�->�	�G%�>�4�_�f>�A��>�[z���>��=(�>�ϭ���>��a�?;	>�4��'�>�C�Ϳ�? >�ߞN?�^`|?�'!8e?	���tw?��m44?��ClFU?_]�p�?�|<Rh�?�ҥ��?!��*�?$zs�?'�Y�EF?+��B�?�?0F�B@�?3�\�?6v�n�SH?:dx}�.??).���?B7CMfEP?Ef�.���?I%@!b�?M��F�Qy?QZ��=?Tc�c��?W���Kë?\%nȎF?`��0�Z�?cm!�e�?f��i��.?j���TV�?o�yha�7?r���0q?u��%��?y�Us)�:?~8���Q?��@��|?�����>�?�W,��_�?����)Z?�̵(�??����A?�0��	?�>�\��,?�j,��?��
����?�����?��:�H|P?�v}/9�?��|��?��A?��m'@�?�h)dR�?������?��Z�S?Ǐ�yH�?ˮ��~8[?�C!2�R�?�@9ۄ@?�r���ĉ?�_�E�J	?����]?�4ƨX?�cȎ�?� �{I��?텴�{Q�>z�򚼯H>�գ��>�����7>��?���>����+�>�/�E�>����a�>��M�T�>�]�,
�j>����z̞>��*a�i�>�� �Z�a>�6�dگH>�F)56Ȼ>��s��~>��VK'�>�ޜȩ>���ʾ>���@�/�>��=��z>�<+g�e>���n,�>���}�>�6a���>�@a9M<>ז�J�>۶$R: ,>�Gq���>� R'5�a>�x��[ą>�f��4ޕ>����>�8ߢ���>�h����>�'Qn3�>��� �L�?\]޵�?e���S�?���@?'�3��z?�Hv�1%?n�L
7�?���|�?�3�t)6?�B�5�3?"�����?%��Lh8?)����BO?.�Tb /?1��eY�?4�k���4?8YS��P�?<��9A�1?@�1o�a�?C��ۨ��?G2����`?KAW��2?P�y�T�?Rϴ�S��?V�ݶA�?Y��y7�?^�(֬Y%?a��
�\?e��d�?h�L;���?m�����?q1:�O�?t��p�?w����9=?{�>j���?�D�O<�?���4?�t�t��?�b#G}
?��k� ��?�5�^��?�d��%�3?�"�D�Y?��P�vff?�YLQ���?�b���.?�� ��?�"�04��?��\Ң�?�ki��x�?����.n�?��v.���?�~�}��=?j�/@M?ż�e�s?ɊW|��?���Η6?Ѡ�?)�H?Ե�+m+�?�U���?ܖv���?��9��?�%p��q?�.�R�0�?�<��ξ�?�      ?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,< s�>}�q<Ym�	y��<�]͢N��=������=VbVY%=n=��{�5=�<�d�B>9�)��s>��$&H��>�^��L�x?��ꌡ�?A���¤l?{�b���$?�FB����?��O�@s ����@HFѡ7c@t�I��%@�S��s�b@��W�@���R-܂ArB�E�wA!V��,kCA9y�ٻ�AP ��\�Aau���=ApPG�M�Ax����A��o��~A����XA}�!mIMAvE�2-�Ak4��n=�A\eXPAISz,��HA3����AO�8�t�A ����B�@�!���;@���R��0@��5��Y�@�RT�M̳@w��5�.@c�G���@QH�b�n@@=jf�־@1 ��g�@$i�#T@��u��@�0�Q7@D����@閥�h@�.�&�@��|���@p.2CR�@ �W�t�@'�M?���@2�-�Eo@>(G��
@Gr�u�@Q݈��ނ@Z������@c��Ȳ�@jf�2ɪ@m�|;���@jo��)U�@`5N(�@>t�H�
��)�O���u�k`�����m���_��K��}M���������q���0����,C)�R��Xt���(�;��r��K�O_�P�|�_�rݺF}��Q ��g�č]�θ~ ������3�x����y��n��ph�1��z�Kͫ���ͳ
�J����}	��K����2���(��"�J�	|��cگ}�*M̬q���_Y��:�;dꭕF�|d����?���ŬBp�9o���4PM�>E��r�7�z�0�+V���89L&�2�8��0�y#9��=*�'9a1p,�8�9��aA��:Ĩr�"�:n��!���:�aǘ�E�;d'�X'�;b�%��-;��1+j :;��a"��<;���*r�<�׀_<��՛�iP<����!�=4�_�&4=l����d=��Q�n��=�3�ڷ=�/�p*�>(���(F�>P�Ƅ�>t45-�>����VՇ>�5�ۖ{�>����>���4T>񌣝_Cd>�O%M�?����?
г�{?
+�Gb��?&'zJ-? ���T>�6���!%>�X�>�~k�d>��r6#k�>������^>���0E+>�FrEK>��h�P�>~
��y+}>u�b�u��>pe���==>l͎��*>k����>o7b�Φ~>t�"d8>|��@�	>���|/��>���w��>�]��B��>�L����>�E�fq�>�}���D%>�a�-8��? � ��C?�L���?+P����X?AbNq;��?Uμ��[t?i���j*�?z�����?�r�薚?��l1H;?�)�%!�?�o���D?\�t�,�7?���	Bu>�.á��>ROP#��{=�A��ӯ�=<��E�c<�3Z@�m;�I�X�mS;2�Gl��:n7�d�Q!9������8�H�1�t�7�H��c6��ȣ,R�5�s�H�4�菱M�3���g�o�2{�^��w1S�v���c0�����G00_����_/��}߱��/ ��}�).c��,�
-��%����-#Tm��B,���e*�+� �؏�+-�L��l�*������N)�vU��