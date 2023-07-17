CDF       
      gas_species       aero_species      aero_source       	aero_diam      d   aero_diam_edges    e         title          PartMC version 2.6.1 output file   source        PartMC version 2.6.1   UUID      $D1A106C4-1470-4D3D-A1AF-8BC6F00F9003   history       =2023-01-18T10:51:15.936-06:00 created by PartMC version 2.6.1      Conventions       CF-1.4            time             unit      s      description       #time elapsed since simulation start         �   timestep             unit      s      description       current timestep size           �   timestep_index               description       Jan integer that is 1 on the first timestep, 2 on the second timestep, etc.          �   temperature              unit      K      standard_name         air_temperature         �   relative_humidity                unit      1      standard_name         relative_humidity           �   pressure             unit      Pa     standard_name         air_pressure           	longitude                unit      degree_east    standard_name         	longitude              latitude             unit      degree_north   standard_name         latitude           altitude             unit      m      standard_name         altitude           start_time_of_day                unit      s      description       9time-of-day of simulation start in seconds since midnight           $   start_day_of_year                description       &day-of-year number of simulation start          ,   elapsed_time             unit      s      description       #elapsed time since simulation start         0   solar_zenith_angle               unit      radian     description       (current angle from the zenith to the sun        8   height               unit      m      	long_name         boundary layer mixing height        @   gas_species                 names         H2SO4,HNO3,HCl,NH3,NO,NO2      description       tdummy dimension variable (no useful value) - read species names as comma-separated values from the 'names' attribute        H   gas_mosaic_index                	long_name         MOSAIC indices of gas species           `   gas_mixing_ratio                unit      ppb    	long_name         mixing ratios of gas species      0  x   aero_species               names         H2O    description       tdummy dimension variable (no useful value) - read species names as comma-separated values from the 'names' attribute        �   aero_source                names         init   description       sdummy dimension variable (no useful value) - read source names as comma-separated values from the 'names' attribute         �   aero_mosaic_index                  	long_name         !MOSAIC indices of aerosol species           �   aero_density               unit      kg/m^3     	long_name         densities of aerosol species        �   aero_num_ions                  	long_name         4number of ions after dissociation of aerosol species        �   aero_molec_weight                  unit      kg/mol     	long_name         $molecular weights of aerosol species        �   
aero_kappa                 unit      1      	long_name         5hygroscopicity parameters (kappas) of aerosol species           �   fractal_dimension                unit      1      description       !particle volume fractal dimension           �   fractal_prime_radius             unit      m      description       radius of primary particles         �   fractal_vol_fill_factor              unit      1      description       volume filling factor           �   	aero_diam                  unit      m      	long_name         aerosol diameter grid centers      description       �logarithmically spaced centers of aerosol diameter grid, so that aero_diam(i) is the geometric mean of aero_diam_edges(i) and aero_diam_edges(i + 1)        �   aero_diam_edges                unit      m      	long_name         aerosol diameter grid edges    description       Ulogarithmically spaced edges of aerosol diameter grid, with one more edge than center        (     aero_diam_widths               unit      1      	long_name         aerosol diameter grid widths   description       ~base-e logarithmic widths of aerosol diameter grid, with aero_diam_widths(i) = ln(aero_diam_edges(i + 1) / aero_diam_edges(i))          0   aero_number_concentration                  unit      1/m^3      	long_name         .aerosol number size concentration distribution     description       �logarithmic number size concentration, d N(r)/d ln D --- multiply by aero_diam_widths(i) and sum over i to compute the total number concentration           P   aero_mass_concentration                   unit      kg/m^3     	long_name         ,aerosol mass size concentration distribution   description       �logarithmic mass size concentration per species, d M(r,s)/d ln D --- multiply by aero_diam_widths(i) and sum over i to compute the total mass concentration of species s        "p@��     @r�        @r      ?�����+@�j             @D                         @��             @�@                                                                                                   @�@         ?�n��O�;        @      >Ey��0�:?�      >}�d���>��([�>��)�Q>��-��u=>����4>�H�g��%>�"-�,>�z���H�>�i#�K'B>��<�R\>�:|�M�>�j�?�Mu>�)��6�9>��&��(>�]��B>�gz�5/�>�����>�*h��>�����Y>�p�.��#>���ߤ�>�Փ/@(>χ�m3>҅S�vS�>��0�>ِ�C�->�	�G%�>�4�_�f>�A��>�[z���>��=(�>�ϭ���>��a�?;	>�4��'�>�C�Ϳ�? >�ߞN?�^`|?�'!8e?	���tw?��m44?��ClFU?_]�p�?�|<Rh�?�ҥ��?!��*�?$zs�?'�Y�EF?+��B�?�?0F�B@�?3�\�?6v�n�SH?:dx}�.??).���?B7CMfEP?Ef�.���?I%@!b�?M��F�Qy?QZ��=?Tc�c��?W���Kë?\%nȎF?`��0�Z�?cm!�e�?f��i��.?j���TV�?o�yha�7?r���0q?u��%��?y�Us)�:?~8���Q?��@��|?�����>�?�W,��_�?����)Z?�̵(�??����A?�0��	?�>�\��,?�j,��?��
����?�����?��:�H|P?�v}/9�?��|��?��A?��m'@�?�h)dR�?������?��Z�S?Ǐ�yH�?ˮ��~8[?�C!2�R�?�@9ۄ@?�r���ĉ?�_�E�J	?����]?�4ƨX?�cȎ�?� �{I��?텴�{Q�>z�򚼯H>�գ��>�����7>��?���>����+�>�/�E�>����a�>��M�T�>�]�,
�j>����z̞>��*a�i�>�� �Z�a>�6�dگH>�F)56Ȼ>��s��~>��VK'�>�ޜȩ>���ʾ>���@�/�>��=��z>�<+g�e>���n,�>���}�>�6a���>�@a9M<>ז�J�>۶$R: ,>�Gq���>� R'5�a>�x��[ą>�f��4ޕ>����>�8ߢ���>�h����>�'Qn3�>��� �L�?\]޵�?e���S�?���@?'�3��z?�Hv�1%?n�L
7�?���|�?�3�t)6?�B�5�3?"�����?%��Lh8?)����BO?.�Tb /?1��eY�?4�k���4?8YS��P�?<��9A�1?@�1o�a�?C��ۨ��?G2����`?KAW��2?P�y�T�?Rϴ�S��?V�ݶA�?Y��y7�?^�(֬Y%?a��
�\?e��d�?h�L;���?m�����?q1:�O�?t��p�?w����9=?{�>j���?�D�O<�?���4?�t�t��?�b#G}
?��k� ��?�5�^��?�d��%�3?�"�D�Y?��P�vff?�YLQ���?�b���.?�� ��?�"�04��?��\Ң�?�ki��x�?����.n�?��v.���?�~�}��=?j�/@M?ż�e�s?ɊW|��?���Η6?Ѡ�?)�H?Ե�+m+�?�U���?ܖv���?��9��?�%p��q?�.�R�0�?�<��ξ�?�      ?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,?ġ��y,< >��A�<YT�LV�<�iX�5�=�;s�ƫ=Vm��ؽ=��7�P�=�E�s�@g>9d��:�>�{��1�>���]�V?�lp/�?A����?z�'՟�?��S"�e?��15@'���C@F�8r�~@r����@�t@�T>@�����@��YD��Aa���A
drPA5����ĚAJ�A��TA[��;�EAh�Ҳ�m�Ar��}�Au����FAu�2oA\Ar�2��`Ah�e-ǚA[\�`��AIX��EA3���A��r�@���`x�@���u��@�Ն$@�F��F&@p���Y@L
�S�k@*��v�@͝��'?��ѸǛ?��(U�?��l��#?���G�G�?k-��w�?[kzf�n?S��ʔE^?R-�Q��X?S�G�0�?W���9(?aU���Ԛ?n)ȁ��?95t�-�?��gB��?�<|�?���tw�?ԯv^��?�]�}@���@+W���@D\�A�X@SєNF��@Ub��a��@A�#�٢��>l��2�<(�is�r���x����{�׿e$H�0�ھ�SQ5����\lY2���.� �?ؽI~�l�ݼV�VKc������l6��ԠL��@��T��`�18x��b�������p%Wlö
�;4�V��׌ؐ����屦=o���}	��K����2���(��"�J�	|��cگ}�*M̬q���_Y��:�;dꭕF�|d����?���ŬBp�9o���4PM�>E��r�7�z�0�+V���88�;��>8�H�����9Oѐ�(�9`���Up9�I, �l	:_�n.*:n3̒�$�:�[f��;��i5;a�Dbڑ1;�ߨ�.AH;�߻#���<:���mrJ<}�3s��W<�}͉�<����0>=3�ux�8=j$[�;�=��o�-_�=�a��~̡=�
e(Ѵ>%���:X�>Ma`E�c�>q���ų>�aar��>�8��}>��r�Cf�>���$��>�c[jo&�>��T�?�>�snr��N>��z���>�R
K8�T>�ű�9D>���>��:>ڛ�{+:�>ȥ���>�oړ�">�Ps�rB[>�N\�->h?�J��>P\��� T>8����A{>"z�s�1O>
�x���=�1�
�u=������~=�G 	��=�LyaC|)=���Qz�;=�([t�3�=��y�y��=�R֬�=�C�Ͻ�=�~Ί:�>RJ*EBc>)���(�>Ij]c�ȗ>i����o>�#�Mv�>����%�'>�pp�ք? ���!?*��V�ޕ?R-Fs���?q������?�Q����?����,}r?�����"�?��Č4�^?T#4�Z�3?
j��b>�Ց��>/0lC�~=��_M�=�x;d�{<]�|	��;�qi��T7:�B+��:�[z�n�9AzA|�8_#~�	7q��9��m6xX�]���5r�6���4^�b;j	36���v�1S�v���c0�����G00_����_/��}߱��/ ��}�).c��,�
-��%����-#Tm��B,���e*�+� �؏�+-�L��l�*������N)�vU��