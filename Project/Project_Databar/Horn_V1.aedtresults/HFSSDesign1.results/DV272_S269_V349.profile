$begin 'Profile'
	$begin 'ProfileGroup'
		MajorVer=2026
		MinorVer=1
		Name='Solution Process'
		$begin 'StartInfo'
			I(1, 'Start Time', '10/28/2026 17:20:05')
			I(1, 'Host', 'DTU-CZC946C81R')
			I(1, 'Processor', '12')
			I(1, 'OS', 'NT 10.0')
			I(1, 'Product', 'HFSS Version 2026.1.0')
		$end 'StartInfo'
		$begin 'TotalInfo'
			I(1, 'Elapsed Time', '01:32:45')
			I(1, 'ComEngine Memory', '110 M')
		$end 'TotalInfo'
		GroupOptions=8
		TaskDataOptions('CPU Time'=8, Memory=8, 'Real Time'=8)
		ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 1, \'Executing From\', \'C:\\\\Program Files\\\\ANSYS Inc\\\\v261\\\\AnsysEM\\\\HFSSCOMENGINE.exe\')', false, true)
		$begin 'ProfileGroup'
			MajorVer=2026
			MinorVer=1
			Name='HPC'
			$begin 'StartInfo'
				I(1, 'Type', 'Auto')
				I(1, 'MPI Vendor', 'Intel')
				I(1, 'MPI Version', '2021')
			$end 'StartInfo'
			$begin 'TotalInfo'
				I(0, ' ')
			$end 'TotalInfo'
			GroupOptions=0
			TaskDataOptions(Memory=8)
			ProfileItem('Machine', 0, 0, 0, 0, 0, 'I(5, 1, \'Name\', \'DTU-CZC946C81R.win.dtu.dk\', 1, \'Memory\', \'128 GB\', 3, \'RAM Limit\', 90, \'%f%%\', 2, \'Cores\', 4, false, 1, \'Free Disk Space\', \'1.05 TB\')', false, true)
		$end 'ProfileGroup'
		ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 1, \'Allow off core\', \'True\')', false, true)
		ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 1, \'Solution Basis Order\', \'1\')', false, true)
		$begin 'ProfileGroup'
			MajorVer=2026
			MinorVer=1
			Name='Design Validation'
			$begin 'StartInfo'
				I(1, 'Level', 'Perform full validations with standard port validations')
			$end 'StartInfo'
			$begin 'TotalInfo'
				I(1, 'Elapsed Time', '00:00:00')
				I(1, 'Memory', '102 M')
			$end 'TotalInfo'
			GroupOptions=0
			TaskDataOptions(Memory=8)
		$end 'ProfileGroup'
		ProfileItem('Mesh Fusion Preprocessing', 0, 0, 0, 0, 0, 'I(1, 0, \'Elapsed time : 00:00:00\')', false, true)
		$begin 'ProfileGroup'
			MajorVer=2026
			MinorVer=1
			Name='Initial Meshing'
			$begin 'StartInfo'
				I(1, 'Time', '10/28/2026 17:20:05')
			$end 'StartInfo'
			$begin 'TotalInfo'
				I(1, 'Elapsed Time', '00:01:39')
			$end 'TotalInfo'
			GroupOptions=4
			TaskDataOptions('CPU Time'=8, Memory=8, 'Real Time'=8)
			ProfileItem('Stitch', 0, 0, 0, 0, 32272, 'I(1, 2, \'Triangles\', 68, false)', true, true)
			ProfileItem('Mesh', 0, 0, 0, 0, 34316, 'I(2, 1, \'Type\', \'Classic\', 2, \'Tetrahedra\', 264, false)', true, true)
			ProfileItem('Post', 0, 0, 0, 0, 35812, 'I(1, 2, \'Tetrahedra\', 232, false)', true, true)
			ProfileItem('Lambda Refine', 78, 0, 78, 0, 796060, 'I(1, 2, \'Tetrahedra\', 268926, false)', true, true)
			ProfileItem('Simulation Setup', 4, 0, 4, 0, 859980, 'I(2, 2, \'Tetrahedra\', 256269, false, 1, \'Disk\', \'0 Bytes\')', true, true)
			ProfileItem('Port Adapt', 3, 0, 3, 0, 862968, 'I(2, 2, \'Tetrahedra\', 256269, false, 1, \'Disk\', \'40.8 KB\')', true, true)
			ProfileItem('Port Refine', 9, 0, 9, 0, 277652, 'I(1, 2, \'Tetrahedra\', 269241, false)', true, true)
		$end 'ProfileGroup'
		$begin 'ProfileGroup'
			MajorVer=2026
			MinorVer=1
			Name='Adaptive Meshing'
			$begin 'StartInfo'
				I(1, 'Time', '10/28/2026 17:21:45')
			$end 'StartInfo'
			$begin 'TotalInfo'
				I(1, 'Elapsed Time', '00:10:54')
			$end 'TotalInfo'
			GroupOptions=4
			TaskDataOptions('CPU Time'=8, Memory=8, 'Real Time'=8)
			$begin 'ProfileGroup'
				MajorVer=2026
				MinorVer=1
				Name='Adaptive Pass 1'
				$begin 'StartInfo'
					I(1, 'Frequency', '34GHz')
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions('CPU Time'=8, Memory=8, 'Real Time'=8)
				ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
				ProfileItem('Simulation Setup ', 5, 0, 5, 0, 900100, 'I(2, 2, \'Tetrahedra\', 256406, false, 1, \'Disk\', \'128 KB\')', true, true)
				ProfileItem('Matrix Assembly', 12, 0, 33, 0, 3.28728e+06, 'I(3, 2, \'Tetrahedra\', 256406, false, 2, \'Port1 Triangles\', 93, false, 1, \'Disk\', \'0 Bytes\')', true, true)
				ProfileItem('Matrix Solve', 135, 0, 459, 0, 2.43242e+07, 'I(5, 1, \'Type\', \'DCS\', 2, \'Cores\', 4, false, 2, \'Matrix size\', 1637217, false, 3, \'Matrix bandwidth\', 21.6631, \'%5.1f\', 1, \'Disk\', \'6.25 MB\')', true, true)
				ProfileItem('Field Recovery', 4, 0, 10, 0, 2.43242e+07, 'I(2, 2, \'Excitations\', 1, false, 1, \'Disk\', \'35.8 MB\')', true, true)
				ProfileItem('Data Transfer', 0, 0, 0, 0, 107560, 'I(1, 0, \'Adaptive Pass 1\')', true, true)
				$begin 'ProfileGroup'
					MajorVer=2026
					MinorVer=1
					Name='APIPms'
					$begin 'StartInfo'
						I(1, 'Timesinceepock', '1793204659')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, ' ')
					$end 'TotalInfo'
					GroupOptions=16
					TaskDataOptions(Memory=8)
					ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_sym\', 1, \'Matrixdim\', \'1637217\', 1, \'Matrixbw\', \'21.663401\', 1, \'Matrixnnz\', \'35467715\', 1, \'Rootdim\', \'5415\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
					ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'win\', 1, \'Cpuid\', \'Intel(R) Xeon(R) W-2133 CPU @ 3.60GHz\', 1, \'CpuPhysicCores\', \'6\', 1, \'CpuLogicCores\', \'12\', 1, \'Cpufreqkhz\', \'3600000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'24.000000\', 1, \'Cpuestgflops\', \'2304.000000\', 1, \'Memorybwestkbps\', \'51.200001\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'137439000000.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'141999\', 1, \'Factornnz\', \'1137023569\', 1, \'Factorestflops\', \'8898550000000\', 1, \'Fbsestflops\', \'3839790000\', 1, \'Rootfactestflops\', \'52926600000\', 1, \'Rootfbsestflops\', \'14661112\', 1, \'Analysistimesec\', \'25.024500\', 1, \'Analysismemkb\', \'1022700.000000\')', false, true)
					ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'4\', 1, \'Factorizationtimesec\', \'105.925000\', 1, \'Factorizationmentotalkb\', \'25351600.000000\')', false, true)
					ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'fullsolve\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'false\', 1, \'Fbsnumcores\', \'4\', 1, \'Fbsnumsolvestotal\', \'1\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'3.332290\', 1, \'Fbscputimesec\', \'3.332290\', 1, \'Fbsmemorytotalkb\', \'21969100.000000\')', false, true)
					ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'25351623\', 1, \'Maxdiskkb\', \'0\')', false, true)
				$end 'ProfileGroup'
			$end 'ProfileGroup'
			ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
			$begin 'ProfileGroup'
				MajorVer=2026
				MinorVer=1
				Name='Adaptive Pass 2'
				$begin 'StartInfo'
					I(1, 'Frequency', '34GHz')
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions('CPU Time'=8, Memory=8, 'Real Time'=8)
				ProfileItem('Adaptive Refine', 21, 0, 22, 0, 368060, 'I(1, 2, \'Tetrahedra\', 346163, false)', true, true)
				ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
				ProfileItem('Simulation Setup ', 6, 0, 6, 0, 1.09124e+06, 'I(2, 2, \'Tetrahedra\', 330305, false, 1, \'Disk\', \'148 KB\')', true, true)
				ProfileItem('Matrix Assembly', 16, 0, 44, 0, 4.13432e+06, 'I(3, 2, \'Tetrahedra\', 330305, false, 2, \'Port1 Triangles\', 101, false, 1, \'Disk\', \'298 Bytes\')', true, true)
				ProfileItem('Matrix Solve', 182, 0, 621, 0, 3.0046e+07, 'I(5, 1, \'Type\', \'DCS\', 2, \'Cores\', 4, false, 2, \'Matrix size\', 2101077, false, 3, \'Matrix bandwidth\', 21.7315, \'%5.1f\', 1, \'Disk\', \'8.02 MB\')', true, true)
				ProfileItem('Field Recovery', 5, 0, 11, 0, 3.0046e+07, 'I(2, 2, \'Excitations\', 1, false, 1, \'Disk\', \'18.2 MB\')', true, true)
				ProfileItem('Data Transfer', 0, 0, 0, 0, 107856, 'I(1, 0, \'Adaptive Pass 2\')', true, true)
				$begin 'ProfileGroup'
					MajorVer=2026
					MinorVer=1
					Name='APIPms'
					$begin 'StartInfo'
						I(1, 'Timesinceepock', '1793204893')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, ' ')
					$end 'TotalInfo'
					GroupOptions=16
					TaskDataOptions(Memory=8)
					ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_sym\', 1, \'Matrixdim\', \'2101077\', 1, \'Matrixbw\', \'21.732201\', 1, \'Matrixnnz\', \'45660957\', 1, \'Rootdim\', \'2011\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
					ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'win\', 1, \'Cpuid\', \'Intel(R) Xeon(R) W-2133 CPU @ 3.60GHz\', 1, \'CpuPhysicCores\', \'6\', 1, \'CpuLogicCores\', \'12\', 1, \'Cpufreqkhz\', \'3600000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'24.000000\', 1, \'Cpuestgflops\', \'2304.000000\', 1, \'Memorybwestkbps\', \'51.200001\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'137439000000.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'181769\', 1, \'Factornnz\', \'1546450299\', 1, \'Factorestflops\', \'12789400000000\', 1, \'Fbsestflops\', \'5272560000\', 1, \'Rootfactestflops\', \'2710920000\', 1, \'Rootfbsestflops\', \'2022060\', 1, \'Analysistimesec\', \'32.738800\', 1, \'Analysismemkb\', \'1317160.000000\')', false, true)
					ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'4\', 1, \'Factorizationtimesec\', \'143.210000\', 1, \'Factorizationmentotalkb\', \'32265400.000000\')', false, true)
					ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'fullsolve\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'false\', 1, \'Fbsnumcores\', \'4\', 1, \'Fbsnumsolvestotal\', \'1\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'4.344560\', 1, \'Fbscputimesec\', \'4.344560\', 1, \'Fbsmemorytotalkb\', \'27112000.000000\')', false, true)
					ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'32265372\', 1, \'Maxdiskkb\', \'0\')', false, true)
				$end 'ProfileGroup'
				ProfileFootnote('I(1, 3, \'Max Mag. Delta S\', 0.0342032, \'%.5f\')', 0)
			$end 'ProfileGroup'
			ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
			$begin 'ProfileGroup'
				MajorVer=2026
				MinorVer=1
				Name='Adaptive Pass 3'
				$begin 'StartInfo'
					I(1, 'Frequency', '34GHz')
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions('CPU Time'=8, Memory=8, 'Real Time'=8)
				ProfileItem('Adaptive Refine', 16, 0, 17, 0, 350752, 'I(1, 2, \'Tetrahedra\', 382773, false)', true, true)
				ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
				ProfileItem('Simulation Setup ', 6, 0, 6, 0, 1.19546e+06, 'I(2, 2, \'Tetrahedra\', 364603, false, 1, \'Disk\', \'141 KB\')', true, true)
				ProfileItem('Matrix Assembly', 17, 0, 46, 0, 4.54536e+06, 'I(3, 2, \'Tetrahedra\', 364603, false, 2, \'Port1 Triangles\', 129, false, 1, \'Disk\', \'1.01 KB\')', true, true)
				ProfileItem('Matrix Solve', 203, 0, 700, 0, 3.32369e+07, 'I(5, 1, \'Type\', \'DCS\', 2, \'Cores\', 4, false, 2, \'Matrix size\', 2314239, false, 3, \'Matrix bandwidth\', 21.7341, \'%5.1f\', 1, \'Disk\', \'8.83 MB\')', true, true)
				ProfileItem('Field Recovery', 6, 0, 12, 0, 3.32369e+07, 'I(2, 2, \'Excitations\', 1, false, 1, \'Disk\', \'14.7 MB\')', true, true)
				ProfileItem('Data Transfer', 0, 0, 0, 0, 108040, 'I(1, 0, \'Adaptive Pass 3\')', true, true)
				$begin 'ProfileGroup'
					MajorVer=2026
					MinorVer=1
					Name='APIPms'
					$begin 'StartInfo'
						I(1, 'Timesinceepock', '1793205146')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, ' ')
					$end 'TotalInfo'
					GroupOptions=16
					TaskDataOptions(Memory=8)
					ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_sym\', 1, \'Matrixdim\', \'2314239\', 1, \'Matrixbw\', \'21.735001\', 1, \'Matrixnnz\', \'50299876\', 1, \'Rootdim\', \'1653\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
					ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'win\', 1, \'Cpuid\', \'Intel(R) Xeon(R) W-2133 CPU @ 3.60GHz\', 1, \'CpuPhysicCores\', \'6\', 1, \'CpuLogicCores\', \'12\', 1, \'Cpufreqkhz\', \'3600000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'24.000000\', 1, \'Cpuestgflops\', \'2304.000000\', 1, \'Memorybwestkbps\', \'51.200001\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'137439000000.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'200283\', 1, \'Factornnz\', \'1725066198\', 1, \'Factorestflops\', \'14677200000000\', 1, \'Fbsestflops\', \'5904620000\', 1, \'Rootfactestflops\', \'1505565794\', 1, \'Rootfbsestflops\', \'1366204\', 1, \'Analysistimesec\', \'35.382900\', 1, \'Analysismemkb\', \'1451900.000000\')', false, true)
					ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'4\', 1, \'Factorizationtimesec\', \'161.405000\', 1, \'Factorizationmentotalkb\', \'36675400.000000\')', false, true)
					ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'fullsolve\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'false\', 1, \'Fbsnumcores\', \'4\', 1, \'Fbsnumsolvestotal\', \'1\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'4.968860\', 1, \'Fbscputimesec\', \'4.968860\', 1, \'Fbsmemorytotalkb\', \'30013800.000000\')', false, true)
					ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'36675449\', 1, \'Maxdiskkb\', \'0\')', false, true)
				$end 'ProfileGroup'
				ProfileFootnote('I(1, 3, \'Max Mag. Delta S\', 0.00385347, \'%.5f\')', 0)
			$end 'ProfileGroup'
			ProfileFootnote('I(1, 0, \'Adaptive Passes converged\')', 0)
		$end 'ProfileGroup'
		$begin 'ProfileGroup'
			MajorVer=2026
			MinorVer=1
			Name='Frequency Sweep'
			$begin 'StartInfo'
				I(1, 'Time', '10/28/2026 17:32:40')
			$end 'StartInfo'
			$begin 'TotalInfo'
				I(1, 'Elapsed Time', '01:20:11')
			$end 'TotalInfo'
			GroupOptions=4
			TaskDataOptions('CPU Time'=8, Memory=8, 'Real Time'=8)
			ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 1, \'HPC\', \'Enabled\')', false, true)
			$begin 'ProfileGroup'
				MajorVer=2026
				MinorVer=1
				Name='Solution - Sweep'
				$begin 'StartInfo'
					I(0, 'Interpolating HFSS Frequency Sweep, Solving Distributed - up to 4 frequencies in parallel')
					I(1, 'Time', '10/28/2026 17:32:40')
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(1, 'Elapsed Time', '01:20:11')
				$end 'TotalInfo'
				GroupOptions=4
				TaskDataOptions('CPU Time'=8, Memory=8, 'Real Time'=8)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'From 26.5GHz to 40GHz, 136 Frequencies\')', false, true)
				ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
				$begin 'ProfileGroup'
					MajorVer=2026
					MinorVer=1
					Name='Frequency - 40GHz'
					$begin 'StartInfo'
						I(0, 'DTU-CZC946C81R.win.dtu.dk')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:11:32')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #1\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 6, 0, 6, 0, 1.17904e+06, 'I(2, 2, \'Tetrahedra\', 364603, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 35, 0, 35, 0, 2.19449e+06, 'I(3, 2, \'Tetrahedra\', 364603, false, 2, \'Port1 Triangles\', 129, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 649, 0, 648, 0, 8.9446e+06, 'I(6, 1, \'Type\', \'DCS\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 2314239, false, 3, \'Matrix bandwidth\', 21.7341, \'%5.1f\', 2, \'S-matrix only solve\', 1, false, 1, \'Disk\', \'8.83 MB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 8.9446e+06, 'I(2, 2, \'Excitations\', 1, false, 1, \'Disk\', \'2.34 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2026
						MinorVer=1
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1793205853')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_sym\', 1, \'Matrixdim\', \'2314239\', 1, \'Matrixbw\', \'21.735001\', 1, \'Matrixnnz\', \'50299876\', 1, \'Rootdim\', \'1653\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'win\', 1, \'Cpuid\', \'Intel(R) Xeon(R) W-2133 CPU @ 3.60GHz\', 1, \'CpuPhysicCores\', \'6\', 1, \'CpuLogicCores\', \'12\', 1, \'Cpufreqkhz\', \'3600000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'24.000000\', 1, \'Cpuestgflops\', \'2304.000000\', 1, \'Memorybwestkbps\', \'51.200001\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'137439000000.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'200249\', 1, \'Factornnz\', \'1704195084\', 1, \'Factorestflops\', \'13946600000000\', 1, \'Fbsestflops\', \'5800240000\', 1, \'Rootfactestflops\', \'1505565793\', 1, \'Rootfbsestflops\', \'1366204\', 1, \'Analysistimesec\', \'61.008100\', 1, \'Analysismemkb\', \'1451440.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'586.686000\', 1, \'Factorizationmentotalkb\', \'5747260.000000\')', false, true)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'1\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.004980\', 1, \'Fbscputimesec\', \'0.004980\', 1, \'Fbsmemorytotalkb\', \'5712020.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'5747264\', 1, \'Maxdiskkb\', \'0\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				$begin 'ProfileGroup'
					MajorVer=2026
					MinorVer=1
					Name='Frequency - 26.5GHz'
					$begin 'StartInfo'
						I(0, 'DTU-CZC946C81R.win.dtu.dk')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:11:33')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #1\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 6, 0, 6, 0, 1.17926e+06, 'I(2, 2, \'Tetrahedra\', 364603, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 35, 0, 35, 0, 2.19491e+06, 'I(3, 2, \'Tetrahedra\', 364603, false, 2, \'Port1 Triangles\', 129, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 650, 0, 648, 0, 8.94432e+06, 'I(6, 1, \'Type\', \'DCS\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 2314239, false, 3, \'Matrix bandwidth\', 21.7341, \'%5.1f\', 2, \'S-matrix only solve\', 1, false, 1, \'Disk\', \'8.83 MB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 8.94432e+06, 'I(2, 2, \'Excitations\', 1, false, 1, \'Disk\', \'2.34 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2026
						MinorVer=1
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1793205855')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_sym\', 1, \'Matrixdim\', \'2314239\', 1, \'Matrixbw\', \'21.735001\', 1, \'Matrixnnz\', \'50299876\', 1, \'Rootdim\', \'1653\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'win\', 1, \'Cpuid\', \'Intel(R) Xeon(R) W-2133 CPU @ 3.60GHz\', 1, \'CpuPhysicCores\', \'6\', 1, \'CpuLogicCores\', \'12\', 1, \'Cpufreqkhz\', \'3600000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'24.000000\', 1, \'Cpuestgflops\', \'2304.000000\', 1, \'Memorybwestkbps\', \'51.200001\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'137439000000.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'200249\', 1, \'Factornnz\', \'1704195084\', 1, \'Factorestflops\', \'13946600000000\', 1, \'Fbsestflops\', \'5800240000\', 1, \'Rootfactestflops\', \'1505565793\', 1, \'Rootfbsestflops\', \'1366204\', 1, \'Analysistimesec\', \'61.110200\', 1, \'Analysismemkb\', \'1451440.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'587.168000\', 1, \'Factorizationmentotalkb\', \'5747260.000000\')', false, true)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'1\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.004173\', 1, \'Fbscputimesec\', \'0.004173\', 1, \'Fbsmemorytotalkb\', \'5711460.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'5747264\', 1, \'Maxdiskkb\', \'0\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				$begin 'ProfileGroup'
					MajorVer=2026
					MinorVer=1
					Name='Frequency - 33.25GHz'
					$begin 'StartInfo'
						I(0, 'DTU-CZC946C81R.win.dtu.dk')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:11:32')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #1\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 6, 0, 6, 0, 1.17894e+06, 'I(2, 2, \'Tetrahedra\', 364603, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 35, 0, 35, 0, 2.1943e+06, 'I(3, 2, \'Tetrahedra\', 364603, false, 2, \'Port1 Triangles\', 129, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 649, 0, 648, 0, 8.94239e+06, 'I(6, 1, \'Type\', \'DCS\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 2314239, false, 3, \'Matrix bandwidth\', 21.7341, \'%5.1f\', 2, \'S-matrix only solve\', 1, false, 1, \'Disk\', \'8.83 MB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 8.94239e+06, 'I(2, 2, \'Excitations\', 1, false, 1, \'Disk\', \'2.34 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2026
						MinorVer=1
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1793205855')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_sym\', 1, \'Matrixdim\', \'2314239\', 1, \'Matrixbw\', \'21.735001\', 1, \'Matrixnnz\', \'50299876\', 1, \'Rootdim\', \'1653\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'win\', 1, \'Cpuid\', \'Intel(R) Xeon(R) W-2133 CPU @ 3.60GHz\', 1, \'CpuPhysicCores\', \'6\', 1, \'CpuLogicCores\', \'12\', 1, \'Cpufreqkhz\', \'3600000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'24.000000\', 1, \'Cpuestgflops\', \'2304.000000\', 1, \'Memorybwestkbps\', \'51.200001\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'137439000000.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'200249\', 1, \'Factornnz\', \'1704195084\', 1, \'Factorestflops\', \'13946600000000\', 1, \'Fbsestflops\', \'5800240000\', 1, \'Rootfactestflops\', \'1505565793\', 1, \'Rootfbsestflops\', \'1366204\', 1, \'Analysistimesec\', \'60.946600\', 1, \'Analysismemkb\', \'1451480.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'586.842000\', 1, \'Factorizationmentotalkb\', \'5747260.000000\')', false, true)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'1\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.004190\', 1, \'Fbscputimesec\', \'0.004190\', 1, \'Fbsmemorytotalkb\', \'5710520.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'5747264\', 1, \'Maxdiskkb\', \'0\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				$begin 'ProfileGroup'
					MajorVer=2026
					MinorVer=1
					Name='Frequency - 29.875GHz'
					$begin 'StartInfo'
						I(0, 'DTU-CZC946C81R.win.dtu.dk')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:11:32')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #1\')', false, true)
					ProfileItem('Simulation Setup ', 6, 0, 6, 0, 1.17908e+06, 'I(2, 2, \'Tetrahedra\', 364603, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 36, 0, 35, 0, 2.19486e+06, 'I(3, 2, \'Tetrahedra\', 364603, false, 2, \'Port1 Triangles\', 129, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 649, 0, 648, 0, 8.94591e+06, 'I(6, 1, \'Type\', \'DCS\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 2314239, false, 3, \'Matrix bandwidth\', 21.7341, \'%5.1f\', 2, \'S-matrix only solve\', 1, false, 1, \'Disk\', \'8.83 MB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 8.94591e+06, 'I(2, 2, \'Excitations\', 1, false, 1, \'Disk\', \'2.34 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2026
						MinorVer=1
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1793205855')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_sym\', 1, \'Matrixdim\', \'2314239\', 1, \'Matrixbw\', \'21.735001\', 1, \'Matrixnnz\', \'50299876\', 1, \'Rootdim\', \'1653\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'win\', 1, \'Cpuid\', \'Intel(R) Xeon(R) W-2133 CPU @ 3.60GHz\', 1, \'CpuPhysicCores\', \'6\', 1, \'CpuLogicCores\', \'12\', 1, \'Cpufreqkhz\', \'3600000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'24.000000\', 1, \'Cpuestgflops\', \'2304.000000\', 1, \'Memorybwestkbps\', \'51.200001\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'137439000000.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'200249\', 1, \'Factornnz\', \'1704195084\', 1, \'Factorestflops\', \'13946600000000\', 1, \'Fbsestflops\', \'5800240000\', 1, \'Rootfactestflops\', \'1505565793\', 1, \'Rootfbsestflops\', \'1366204\', 1, \'Analysistimesec\', \'61.032300\', 1, \'Analysismemkb\', \'1451410.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'586.618000\', 1, \'Factorizationmentotalkb\', \'5747260.000000\')', false, true)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'1\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.004417\', 1, \'Fbscputimesec\', \'0.004417\', 1, \'Fbsmemorytotalkb\', \'5712890.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'5747264\', 1, \'Maxdiskkb\', \'0\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 1, Frequency: 40GHz; Additional basis points are needed before the interpolation error can be computed.\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 2, Frequency: 26.5GHz; Additional basis points are needed before the interpolation error can be computed.\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 3, Frequency: 33.25GHz; S Matrix Error =   3.367%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 4, Frequency: 29.875GHz; S Matrix Error =   1.038%\')', false, true)
				ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
				$begin 'ProfileGroup'
					MajorVer=2026
					MinorVer=1
					Name='Frequency - 36.625GHz'
					$begin 'StartInfo'
						I(0, 'DTU-CZC946C81R.win.dtu.dk')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:10:45')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #2\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 5, 0, 5, 0, 1.17893e+06, 'I(2, 2, \'Tetrahedra\', 364603, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 35, 0, 35, 0, 2.19446e+06, 'I(3, 2, \'Tetrahedra\', 364603, false, 2, \'Port1 Triangles\', 129, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 602, 0, 601, 0, 8.94252e+06, 'I(6, 1, \'Type\', \'DCS\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 2314239, false, 3, \'Matrix bandwidth\', 21.7341, \'%5.1f\', 2, \'S-matrix only solve\', 1, false, 1, \'Disk\', \'1.63 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 8.94252e+06, 'I(2, 2, \'Excitations\', 1, false, 1, \'Disk\', \'2.34 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2026
						MinorVer=1
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1793206518')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_sym\', 1, \'Matrixdim\', \'2314239\', 1, \'Matrixbw\', \'21.735001\', 1, \'Matrixnnz\', \'50299876\', 1, \'Rootdim\', \'1653\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'win\', 1, \'Cpuid\', \'Intel(R) Xeon(R) W-2133 CPU @ 3.60GHz\', 1, \'CpuPhysicCores\', \'6\', 1, \'CpuLogicCores\', \'12\', 1, \'Cpufreqkhz\', \'3600000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'24.000000\', 1, \'Cpuestgflops\', \'2304.000000\', 1, \'Memorybwestkbps\', \'51.200001\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'137439000000.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'200249\', 1, \'Factornnz\', \'1704195084\', 1, \'Factorestflops\', \'13946600000000\', 1, \'Fbsestflops\', \'5800240000\', 1, \'Rootfactestflops\', \'1505565793\', 1, \'Rootfbsestflops\', \'1366204\', 1, \'Analysistimesec\', \'14.548000\', 1, \'Analysismemkb\', \'1297980.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'586.515000\', 1, \'Factorizationmentotalkb\', \'5747260.000000\')', false, true)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'1\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.004442\', 1, \'Fbscputimesec\', \'0.004442\', 1, \'Fbsmemorytotalkb\', \'5709940.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'5747264\', 1, \'Maxdiskkb\', \'0\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				$begin 'ProfileGroup'
					MajorVer=2026
					MinorVer=1
					Name='Frequency - 31.5625GHz'
					$begin 'StartInfo'
						I(0, 'DTU-CZC946C81R.win.dtu.dk')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:10:45')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #2\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 6, 0, 6, 0, 1.17899e+06, 'I(2, 2, \'Tetrahedra\', 364603, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 35, 0, 35, 0, 2.195e+06, 'I(3, 2, \'Tetrahedra\', 364603, false, 2, \'Port1 Triangles\', 129, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 603, 0, 602, 0, 8.94385e+06, 'I(6, 1, \'Type\', \'DCS\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 2314239, false, 3, \'Matrix bandwidth\', 21.7341, \'%5.1f\', 2, \'S-matrix only solve\', 1, false, 1, \'Disk\', \'1.63 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 8.94385e+06, 'I(2, 2, \'Excitations\', 1, false, 1, \'Disk\', \'2.34 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2026
						MinorVer=1
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1793206519')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_sym\', 1, \'Matrixdim\', \'2314239\', 1, \'Matrixbw\', \'21.735001\', 1, \'Matrixnnz\', \'50299876\', 1, \'Rootdim\', \'1653\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'win\', 1, \'Cpuid\', \'Intel(R) Xeon(R) W-2133 CPU @ 3.60GHz\', 1, \'CpuPhysicCores\', \'6\', 1, \'CpuLogicCores\', \'12\', 1, \'Cpufreqkhz\', \'3600000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'24.000000\', 1, \'Cpuestgflops\', \'2304.000000\', 1, \'Memorybwestkbps\', \'51.200001\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'137439000000.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'200249\', 1, \'Factornnz\', \'1704195084\', 1, \'Factorestflops\', \'13946600000000\', 1, \'Fbsestflops\', \'5800240000\', 1, \'Rootfactestflops\', \'1505565793\', 1, \'Rootfbsestflops\', \'1366204\', 1, \'Analysistimesec\', \'14.648800\', 1, \'Analysismemkb\', \'1297980.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'586.789000\', 1, \'Factorizationmentotalkb\', \'5747260.000000\')', false, true)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'1\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.004465\', 1, \'Fbscputimesec\', \'0.004465\', 1, \'Fbsmemorytotalkb\', \'5710730.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'5747264\', 1, \'Maxdiskkb\', \'0\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				$begin 'ProfileGroup'
					MajorVer=2026
					MinorVer=1
					Name='Frequency - 28.1875GHz'
					$begin 'StartInfo'
						I(0, 'DTU-CZC946C81R.win.dtu.dk')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:10:46')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #2\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 6, 0, 6, 0, 1.17887e+06, 'I(2, 2, \'Tetrahedra\', 364603, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 35, 0, 35, 0, 2.19194e+06, 'I(3, 2, \'Tetrahedra\', 364603, false, 2, \'Port1 Triangles\', 129, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 603, 0, 601, 0, 8.9469e+06, 'I(6, 1, \'Type\', \'DCS\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 2314239, false, 3, \'Matrix bandwidth\', 21.7341, \'%5.1f\', 2, \'S-matrix only solve\', 1, false, 1, \'Disk\', \'1.63 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 8.9469e+06, 'I(2, 2, \'Excitations\', 1, false, 1, \'Disk\', \'2.34 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2026
						MinorVer=1
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1793206520')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_sym\', 1, \'Matrixdim\', \'2314239\', 1, \'Matrixbw\', \'21.735001\', 1, \'Matrixnnz\', \'50299876\', 1, \'Rootdim\', \'1653\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'win\', 1, \'Cpuid\', \'Intel(R) Xeon(R) W-2133 CPU @ 3.60GHz\', 1, \'CpuPhysicCores\', \'6\', 1, \'CpuLogicCores\', \'12\', 1, \'Cpufreqkhz\', \'3600000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'24.000000\', 1, \'Cpuestgflops\', \'2304.000000\', 1, \'Memorybwestkbps\', \'51.200001\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'137439000000.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'200249\', 1, \'Factornnz\', \'1704195084\', 1, \'Factorestflops\', \'13946600000000\', 1, \'Fbsestflops\', \'5800240000\', 1, \'Rootfactestflops\', \'1505565793\', 1, \'Rootfbsestflops\', \'1366204\', 1, \'Analysistimesec\', \'14.623100\', 1, \'Analysismemkb\', \'1297980.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'587.139000\', 1, \'Factorizationmentotalkb\', \'5747260.000000\')', false, true)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'1\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.004340\', 1, \'Fbscputimesec\', \'0.004340\', 1, \'Fbsmemorytotalkb\', \'5716900.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'5747264\', 1, \'Maxdiskkb\', \'0\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				$begin 'ProfileGroup'
					MajorVer=2026
					MinorVer=1
					Name='Frequency - 34.9375GHz'
					$begin 'StartInfo'
						I(0, 'DTU-CZC946C81R.win.dtu.dk')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:10:45')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #2\')', false, true)
					ProfileItem('Simulation Setup ', 6, 0, 6, 0, 1.17884e+06, 'I(2, 2, \'Tetrahedra\', 364603, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 35, 0, 35, 0, 2.19415e+06, 'I(3, 2, \'Tetrahedra\', 364603, false, 2, \'Port1 Triangles\', 129, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 603, 0, 602, 0, 8.94441e+06, 'I(6, 1, \'Type\', \'DCS\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 2314239, false, 3, \'Matrix bandwidth\', 21.7341, \'%5.1f\', 2, \'S-matrix only solve\', 1, false, 1, \'Disk\', \'1.64 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 8.94441e+06, 'I(2, 2, \'Excitations\', 1, false, 1, \'Disk\', \'2.34 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2026
						MinorVer=1
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1793206519')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_sym\', 1, \'Matrixdim\', \'2314239\', 1, \'Matrixbw\', \'21.735001\', 1, \'Matrixnnz\', \'50299876\', 1, \'Rootdim\', \'1653\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'win\', 1, \'Cpuid\', \'Intel(R) Xeon(R) W-2133 CPU @ 3.60GHz\', 1, \'CpuPhysicCores\', \'6\', 1, \'CpuLogicCores\', \'12\', 1, \'Cpufreqkhz\', \'3600000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'24.000000\', 1, \'Cpuestgflops\', \'2304.000000\', 1, \'Memorybwestkbps\', \'51.200001\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'137439000000.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'200249\', 1, \'Factornnz\', \'1704195084\', 1, \'Factorestflops\', \'13946600000000\', 1, \'Fbsestflops\', \'5800240000\', 1, \'Rootfactestflops\', \'1505565793\', 1, \'Rootfbsestflops\', \'1366204\', 1, \'Analysistimesec\', \'14.611400\', 1, \'Analysismemkb\', \'1297980.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'586.567000\', 1, \'Factorizationmentotalkb\', \'5747260.000000\')', false, true)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'1\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.004565\', 1, \'Fbscputimesec\', \'0.004565\', 1, \'Fbsmemorytotalkb\', \'5711510.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'5747264\', 1, \'Maxdiskkb\', \'0\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 5, Frequency: 36.625GHz; S Matrix Error =   1.538%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 6, Frequency: 31.5625GHz; S Matrix Error =   1.484%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 7, Frequency: 28.1875GHz; S Matrix Error =   1.565%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 8, Frequency: 34.9375GHz; S Matrix Error =   4.578%\')', false, true)
				ProfileItem('Data Transfer', 0, 0, 0, 0, 111476, 'I(1, 0, \'Frequency Group #2; Interpolating frequency sweep\')', true, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Frequency: 34GHz has already been solved\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 9, Frequency: 34GHz; S Matrix Error =   4.801%\')', false, true)
				ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
				$begin 'ProfileGroup'
					MajorVer=2026
					MinorVer=1
					Name='Frequency - 30.71875GHz'
					$begin 'StartInfo'
						I(0, 'DTU-CZC946C81R.win.dtu.dk')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:10:49')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #3\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 6, 0, 5, 0, 1.17858e+06, 'I(2, 2, \'Tetrahedra\', 364603, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 36, 0, 35, 0, 2.1977e+06, 'I(3, 2, \'Tetrahedra\', 364603, false, 2, \'Port1 Triangles\', 129, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 606, 0, 605, 0, 8.94242e+06, 'I(6, 1, \'Type\', \'DCS\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 2314239, false, 3, \'Matrix bandwidth\', 21.7341, \'%5.1f\', 2, \'S-matrix only solve\', 1, false, 1, \'Disk\', \'1.63 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 8.94242e+06, 'I(2, 2, \'Excitations\', 1, false, 1, \'Disk\', \'2.34 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2026
						MinorVer=1
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1793207187')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_sym\', 1, \'Matrixdim\', \'2314239\', 1, \'Matrixbw\', \'21.735001\', 1, \'Matrixnnz\', \'50299876\', 1, \'Rootdim\', \'1653\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'win\', 1, \'Cpuid\', \'Intel(R) Xeon(R) W-2133 CPU @ 3.60GHz\', 1, \'CpuPhysicCores\', \'6\', 1, \'CpuLogicCores\', \'12\', 1, \'Cpufreqkhz\', \'3600000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'24.000000\', 1, \'Cpuestgflops\', \'2304.000000\', 1, \'Memorybwestkbps\', \'51.200001\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'137439000000.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'200249\', 1, \'Factornnz\', \'1704195084\', 1, \'Factorestflops\', \'13946600000000\', 1, \'Fbsestflops\', \'5800240000\', 1, \'Rootfactestflops\', \'1505565793\', 1, \'Rootfbsestflops\', \'1366204\', 1, \'Analysistimesec\', \'14.462500\', 1, \'Analysismemkb\', \'1297980.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'590.377000\', 1, \'Factorizationmentotalkb\', \'5747260.000000\')', false, true)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'1\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.005892\', 1, \'Fbscputimesec\', \'0.005892\', 1, \'Fbsmemorytotalkb\', \'5707400.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'5747264\', 1, \'Maxdiskkb\', \'0\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				$begin 'ProfileGroup'
					MajorVer=2026
					MinorVer=1
					Name='Frequency - 38.3125GHz'
					$begin 'StartInfo'
						I(0, 'DTU-CZC946C81R.win.dtu.dk')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:10:50')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #3\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 6, 0, 6, 0, 1.17905e+06, 'I(2, 2, \'Tetrahedra\', 364603, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 35, 0, 35, 0, 2.19634e+06, 'I(3, 2, \'Tetrahedra\', 364603, false, 2, \'Port1 Triangles\', 129, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 607, 0, 606, 0, 8.94238e+06, 'I(6, 1, \'Type\', \'DCS\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 2314239, false, 3, \'Matrix bandwidth\', 21.7341, \'%5.1f\', 2, \'S-matrix only solve\', 1, false, 1, \'Disk\', \'1.64 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 8.94238e+06, 'I(2, 2, \'Excitations\', 1, false, 1, \'Disk\', \'2.34 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2026
						MinorVer=1
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1793207189')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_sym\', 1, \'Matrixdim\', \'2314239\', 1, \'Matrixbw\', \'21.735001\', 1, \'Matrixnnz\', \'50299876\', 1, \'Rootdim\', \'1653\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'win\', 1, \'Cpuid\', \'Intel(R) Xeon(R) W-2133 CPU @ 3.60GHz\', 1, \'CpuPhysicCores\', \'6\', 1, \'CpuLogicCores\', \'12\', 1, \'Cpufreqkhz\', \'3600000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'24.000000\', 1, \'Cpuestgflops\', \'2304.000000\', 1, \'Memorybwestkbps\', \'51.200001\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'137439000000.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'200249\', 1, \'Factornnz\', \'1704195084\', 1, \'Factorestflops\', \'13946600000000\', 1, \'Fbsestflops\', \'5800240000\', 1, \'Rootfactestflops\', \'1505565793\', 1, \'Rootfbsestflops\', \'1366204\', 1, \'Analysistimesec\', \'14.482200\', 1, \'Analysismemkb\', \'1297980.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'591.616000\', 1, \'Factorizationmentotalkb\', \'5747260.000000\')', false, true)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'1\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.004259\', 1, \'Fbscputimesec\', \'0.004259\', 1, \'Fbsmemorytotalkb\', \'5708720.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'5747264\', 1, \'Maxdiskkb\', \'0\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				$begin 'ProfileGroup'
					MajorVer=2026
					MinorVer=1
					Name='Frequency - 34.46875GHz'
					$begin 'StartInfo'
						I(0, 'DTU-CZC946C81R.win.dtu.dk')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:10:49')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #3\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 6, 0, 6, 0, 1.17914e+06, 'I(2, 2, \'Tetrahedra\', 364603, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 35, 0, 35, 0, 2.1949e+06, 'I(3, 2, \'Tetrahedra\', 364603, false, 2, \'Port1 Triangles\', 129, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 606, 0, 605, 0, 8.94674e+06, 'I(6, 1, \'Type\', \'DCS\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 2314239, false, 3, \'Matrix bandwidth\', 21.7341, \'%5.1f\', 2, \'S-matrix only solve\', 1, false, 1, \'Disk\', \'1.63 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 8.94674e+06, 'I(2, 2, \'Excitations\', 1, false, 1, \'Disk\', \'2.34 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2026
						MinorVer=1
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1793207188')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_sym\', 1, \'Matrixdim\', \'2314239\', 1, \'Matrixbw\', \'21.735001\', 1, \'Matrixnnz\', \'50299876\', 1, \'Rootdim\', \'1653\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'win\', 1, \'Cpuid\', \'Intel(R) Xeon(R) W-2133 CPU @ 3.60GHz\', 1, \'CpuPhysicCores\', \'6\', 1, \'CpuLogicCores\', \'12\', 1, \'Cpufreqkhz\', \'3600000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'24.000000\', 1, \'Cpuestgflops\', \'2304.000000\', 1, \'Memorybwestkbps\', \'51.200001\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'137439000000.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'200249\', 1, \'Factornnz\', \'1704195084\', 1, \'Factorestflops\', \'13946600000000\', 1, \'Fbsestflops\', \'5800240000\', 1, \'Rootfactestflops\', \'1505565793\', 1, \'Rootfbsestflops\', \'1366204\', 1, \'Analysistimesec\', \'14.506000\', 1, \'Analysismemkb\', \'1297980.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'590.213000\', 1, \'Factorizationmentotalkb\', \'5747260.000000\')', false, true)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'1\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.009057\', 1, \'Fbscputimesec\', \'0.009057\', 1, \'Fbsmemorytotalkb\', \'5713790.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'5747264\', 1, \'Maxdiskkb\', \'0\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				$begin 'ProfileGroup'
					MajorVer=2026
					MinorVer=1
					Name='Frequency - 27.34375GHz'
					$begin 'StartInfo'
						I(0, 'DTU-CZC946C81R.win.dtu.dk')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:10:49')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #3\')', false, true)
					ProfileItem('Simulation Setup ', 5, 0, 5, 0, 1.17887e+06, 'I(2, 2, \'Tetrahedra\', 364603, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 35, 0, 35, 0, 2.19518e+06, 'I(3, 2, \'Tetrahedra\', 364603, false, 2, \'Port1 Triangles\', 129, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 607, 0, 605, 0, 8.94247e+06, 'I(6, 1, \'Type\', \'DCS\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 2314239, false, 3, \'Matrix bandwidth\', 21.7341, \'%5.1f\', 2, \'S-matrix only solve\', 1, false, 1, \'Disk\', \'1.64 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 8.94247e+06, 'I(2, 2, \'Excitations\', 1, false, 1, \'Disk\', \'2.34 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2026
						MinorVer=1
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1793207189')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_sym\', 1, \'Matrixdim\', \'2314239\', 1, \'Matrixbw\', \'21.735001\', 1, \'Matrixnnz\', \'50299876\', 1, \'Rootdim\', \'1653\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'win\', 1, \'Cpuid\', \'Intel(R) Xeon(R) W-2133 CPU @ 3.60GHz\', 1, \'CpuPhysicCores\', \'6\', 1, \'CpuLogicCores\', \'12\', 1, \'Cpufreqkhz\', \'3600000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'24.000000\', 1, \'Cpuestgflops\', \'2304.000000\', 1, \'Memorybwestkbps\', \'51.200001\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'137439000000.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'200249\', 1, \'Factornnz\', \'1704195084\', 1, \'Factorestflops\', \'13946600000000\', 1, \'Fbsestflops\', \'5800240000\', 1, \'Rootfactestflops\', \'1505565793\', 1, \'Rootfbsestflops\', \'1366204\', 1, \'Analysistimesec\', \'14.504600\', 1, \'Analysismemkb\', \'1297980.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'590.571000\', 1, \'Factorizationmentotalkb\', \'5747260.000000\')', false, true)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'1\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.004518\', 1, \'Fbscputimesec\', \'0.004518\', 1, \'Fbsmemorytotalkb\', \'5709940.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'5747264\', 1, \'Maxdiskkb\', \'0\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 10, Frequency: 30.71875GHz; S Matrix Error =   2.242%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 11, Frequency: 38.3125GHz; S Matrix Error =   0.643%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 12, Frequency: 34.46875GHz; S Matrix Error =   0.204%; Secondary solver criterion is not converged\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 13, Frequency: 27.34375GHz; S Matrix Error =   0.367%; Secondary solver criterion is not converged\')', false, true)
				ProfileItem('Data Transfer', 0, 0, 0, 0, 111632, 'I(1, 0, \'Frequency Group #3; Interpolating frequency sweep\')', true, true)
				ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
				$begin 'ProfileGroup'
					MajorVer=2026
					MinorVer=1
					Name='Frequency - 35.78125GHz'
					$begin 'StartInfo'
						I(0, 'DTU-CZC946C81R.win.dtu.dk')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:10:48')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #4\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 6, 0, 6, 0, 1.17926e+06, 'I(2, 2, \'Tetrahedra\', 364603, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 35, 0, 35, 0, 2.19394e+06, 'I(3, 2, \'Tetrahedra\', 364603, false, 2, \'Port1 Triangles\', 129, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 606, 0, 604, 0, 8.94241e+06, 'I(6, 1, \'Type\', \'DCS\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 2314239, false, 3, \'Matrix bandwidth\', 21.7341, \'%5.1f\', 2, \'S-matrix only solve\', 1, false, 1, \'Disk\', \'1.63 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 8.94241e+06, 'I(2, 2, \'Excitations\', 1, false, 1, \'Disk\', \'2.34 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2026
						MinorVer=1
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1793207854')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_sym\', 1, \'Matrixdim\', \'2314239\', 1, \'Matrixbw\', \'21.735001\', 1, \'Matrixnnz\', \'50299876\', 1, \'Rootdim\', \'1653\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'win\', 1, \'Cpuid\', \'Intel(R) Xeon(R) W-2133 CPU @ 3.60GHz\', 1, \'CpuPhysicCores\', \'6\', 1, \'CpuLogicCores\', \'12\', 1, \'Cpufreqkhz\', \'3600000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'24.000000\', 1, \'Cpuestgflops\', \'2304.000000\', 1, \'Memorybwestkbps\', \'51.200001\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'137439000000.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'200249\', 1, \'Factornnz\', \'1704195084\', 1, \'Factorestflops\', \'13946600000000\', 1, \'Fbsestflops\', \'5800240000\', 1, \'Rootfactestflops\', \'1505565793\', 1, \'Rootfbsestflops\', \'1366204\', 1, \'Analysistimesec\', \'14.630000\', 1, \'Analysismemkb\', \'1297980.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'589.675000\', 1, \'Factorizationmentotalkb\', \'5747260.000000\')', false, true)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'1\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.004632\', 1, \'Fbscputimesec\', \'0.004632\', 1, \'Fbsmemorytotalkb\', \'5710610.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'5747264\', 1, \'Maxdiskkb\', \'0\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				$begin 'ProfileGroup'
					MajorVer=2026
					MinorVer=1
					Name='Frequency - 26.921875GHz'
					$begin 'StartInfo'
						I(0, 'DTU-CZC946C81R.win.dtu.dk')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:10:50')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #4\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 6, 0, 6, 0, 1.17889e+06, 'I(2, 2, \'Tetrahedra\', 364603, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 35, 0, 35, 0, 2.19415e+06, 'I(3, 2, \'Tetrahedra\', 364603, false, 2, \'Port1 Triangles\', 129, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 607, 0, 605, 0, 8.93874e+06, 'I(6, 1, \'Type\', \'DCS\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 2314239, false, 3, \'Matrix bandwidth\', 21.7341, \'%5.1f\', 2, \'S-matrix only solve\', 1, false, 1, \'Disk\', \'1.64 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 8.93874e+06, 'I(2, 2, \'Excitations\', 1, false, 1, \'Disk\', \'2.34 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2026
						MinorVer=1
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1793207856')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_sym\', 1, \'Matrixdim\', \'2314239\', 1, \'Matrixbw\', \'21.735001\', 1, \'Matrixnnz\', \'50299876\', 1, \'Rootdim\', \'1653\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'win\', 1, \'Cpuid\', \'Intel(R) Xeon(R) W-2133 CPU @ 3.60GHz\', 1, \'CpuPhysicCores\', \'6\', 1, \'CpuLogicCores\', \'12\', 1, \'Cpufreqkhz\', \'3600000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'24.000000\', 1, \'Cpuestgflops\', \'2304.000000\', 1, \'Memorybwestkbps\', \'51.200001\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'137439000000.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'200249\', 1, \'Factornnz\', \'1704195084\', 1, \'Factorestflops\', \'13946600000000\', 1, \'Fbsestflops\', \'5800240000\', 1, \'Rootfactestflops\', \'1505565793\', 1, \'Rootfbsestflops\', \'1366204\', 1, \'Analysistimesec\', \'14.590500\', 1, \'Analysismemkb\', \'1297980.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'590.541000\', 1, \'Factorizationmentotalkb\', \'5747260.000000\')', false, true)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'1\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.004716\', 1, \'Fbscputimesec\', \'0.004716\', 1, \'Fbsmemorytotalkb\', \'5707290.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'5747264\', 1, \'Maxdiskkb\', \'0\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				$begin 'ProfileGroup'
					MajorVer=2026
					MinorVer=1
					Name='Frequency - 27.765625GHz'
					$begin 'StartInfo'
						I(0, 'DTU-CZC946C81R.win.dtu.dk')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:10:50')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #4\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 6, 0, 6, 0, 1.17895e+06, 'I(2, 2, \'Tetrahedra\', 364603, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 35, 0, 35, 0, 2.19273e+06, 'I(3, 2, \'Tetrahedra\', 364603, false, 2, \'Port1 Triangles\', 129, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 607, 0, 606, 0, 8.94195e+06, 'I(6, 1, \'Type\', \'DCS\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 2314239, false, 3, \'Matrix bandwidth\', 21.7341, \'%5.1f\', 2, \'S-matrix only solve\', 1, false, 1, \'Disk\', \'1.64 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 8.94195e+06, 'I(2, 2, \'Excitations\', 1, false, 1, \'Disk\', \'2.34 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2026
						MinorVer=1
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1793207856')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_sym\', 1, \'Matrixdim\', \'2314239\', 1, \'Matrixbw\', \'21.735001\', 1, \'Matrixnnz\', \'50299876\', 1, \'Rootdim\', \'1653\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'win\', 1, \'Cpuid\', \'Intel(R) Xeon(R) W-2133 CPU @ 3.60GHz\', 1, \'CpuPhysicCores\', \'6\', 1, \'CpuLogicCores\', \'12\', 1, \'Cpufreqkhz\', \'3600000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'24.000000\', 1, \'Cpuestgflops\', \'2304.000000\', 1, \'Memorybwestkbps\', \'51.200001\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'137439000000.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'200249\', 1, \'Factornnz\', \'1704195084\', 1, \'Factorestflops\', \'13946600000000\', 1, \'Fbsestflops\', \'5800240000\', 1, \'Rootfactestflops\', \'1505565793\', 1, \'Rootfbsestflops\', \'1366204\', 1, \'Analysistimesec\', \'14.695400\', 1, \'Analysismemkb\', \'1297980.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'590.829000\', 1, \'Factorizationmentotalkb\', \'5747260.000000\')', false, true)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'1\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.005986\', 1, \'Fbscputimesec\', \'0.005986\', 1, \'Fbsmemorytotalkb\', \'5712050.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'5747264\', 1, \'Maxdiskkb\', \'0\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				$begin 'ProfileGroup'
					MajorVer=2026
					MinorVer=1
					Name='Frequency - 39.15625GHz'
					$begin 'StartInfo'
						I(0, 'DTU-CZC946C81R.win.dtu.dk')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:10:48')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #4\')', false, true)
					ProfileItem('Simulation Setup ', 6, 0, 6, 0, 1.17869e+06, 'I(2, 2, \'Tetrahedra\', 364603, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 35, 0, 35, 0, 2.19426e+06, 'I(3, 2, \'Tetrahedra\', 364603, false, 2, \'Port1 Triangles\', 129, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 606, 0, 605, 0, 8.94396e+06, 'I(6, 1, \'Type\', \'DCS\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 2314239, false, 3, \'Matrix bandwidth\', 21.7341, \'%5.1f\', 2, \'S-matrix only solve\', 1, false, 1, \'Disk\', \'1.63 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 8.94396e+06, 'I(2, 2, \'Excitations\', 1, false, 1, \'Disk\', \'2.34 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2026
						MinorVer=1
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1793207855')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_sym\', 1, \'Matrixdim\', \'2314239\', 1, \'Matrixbw\', \'21.735001\', 1, \'Matrixnnz\', \'50299876\', 1, \'Rootdim\', \'1653\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'win\', 1, \'Cpuid\', \'Intel(R) Xeon(R) W-2133 CPU @ 3.60GHz\', 1, \'CpuPhysicCores\', \'6\', 1, \'CpuLogicCores\', \'12\', 1, \'Cpufreqkhz\', \'3600000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'24.000000\', 1, \'Cpuestgflops\', \'2304.000000\', 1, \'Memorybwestkbps\', \'51.200001\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'137439000000.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'200249\', 1, \'Factornnz\', \'1704195084\', 1, \'Factorestflops\', \'13946600000000\', 1, \'Fbsestflops\', \'5800240000\', 1, \'Rootfactestflops\', \'1505565793\', 1, \'Rootfbsestflops\', \'1366204\', 1, \'Analysistimesec\', \'14.434100\', 1, \'Analysismemkb\', \'1297980.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'590.094000\', 1, \'Factorizationmentotalkb\', \'5747260.000000\')', false, true)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'1\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.006215\', 1, \'Fbscputimesec\', \'0.006215\', 1, \'Fbsmemorytotalkb\', \'5711600.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'5747264\', 1, \'Maxdiskkb\', \'0\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 14, Frequency: 35.78125GHz; S Matrix Error =   0.424%; Secondary solver criterion is not converged\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 15, Frequency: 26.921875GHz; S Matrix Error =   0.221%; Secondary solver criterion is not converged\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 16, Frequency: 27.765625GHz; S Matrix Error =   0.312%; Secondary solver criterion is not converged\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 17, Frequency: 39.15625GHz; S Matrix Error =   0.117%; Secondary solver criterion is not converged\')', false, true)
				ProfileItem('Data Transfer', 0, 0, 0, 0, 111708, 'I(1, 0, \'Frequency Group #4; Interpolating frequency sweep\')', true, true)
				ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
				$begin 'ProfileGroup'
					MajorVer=2026
					MinorVer=1
					Name='Frequency - 27.5546875GHz'
					$begin 'StartInfo'
						I(0, 'DTU-CZC946C81R.win.dtu.dk')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:11:47')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #5\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 6, 0, 6, 0, 1.1791e+06, 'I(2, 2, \'Tetrahedra\', 364603, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 35, 0, 35, 0, 2.19622e+06, 'I(3, 2, \'Tetrahedra\', 364603, false, 2, \'Port1 Triangles\', 129, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 664, 0, 661, 0, 8.94575e+06, 'I(6, 1, \'Type\', \'DCS\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 2314239, false, 3, \'Matrix bandwidth\', 21.7341, \'%5.1f\', 2, \'S-matrix only solve\', 1, false, 1, \'Disk\', \'1.64 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 8.94575e+06, 'I(2, 2, \'Excitations\', 1, false, 1, \'Disk\', \'2.34 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2026
						MinorVer=1
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1793208580')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_sym\', 1, \'Matrixdim\', \'2314239\', 1, \'Matrixbw\', \'21.735001\', 1, \'Matrixnnz\', \'50299876\', 1, \'Rootdim\', \'1653\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'win\', 1, \'Cpuid\', \'Intel(R) Xeon(R) W-2133 CPU @ 3.60GHz\', 1, \'CpuPhysicCores\', \'6\', 1, \'CpuLogicCores\', \'12\', 1, \'Cpufreqkhz\', \'3600000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'24.000000\', 1, \'Cpuestgflops\', \'2304.000000\', 1, \'Memorybwestkbps\', \'51.200001\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'137439000000.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'200249\', 1, \'Factornnz\', \'1704195084\', 1, \'Factorestflops\', \'13946600000000\', 1, \'Fbsestflops\', \'5800240000\', 1, \'Rootfactestflops\', \'1505565793\', 1, \'Rootfbsestflops\', \'1366204\', 1, \'Analysistimesec\', \'14.643300\', 1, \'Analysismemkb\', \'1297980.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'648.217000\', 1, \'Factorizationmentotalkb\', \'5747260.000000\')', false, true)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'1\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.004514\', 1, \'Fbscputimesec\', \'0.004514\', 1, \'Fbsmemorytotalkb\', \'5711570.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'5747264\', 1, \'Maxdiskkb\', \'0\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				$begin 'ProfileGroup'
					MajorVer=2026
					MinorVer=1
					Name='Frequency - 29.03125GHz'
					$begin 'StartInfo'
						I(0, 'DTU-CZC946C81R.win.dtu.dk')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:11:50')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #5\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 6, 0, 6, 0, 1.17873e+06, 'I(2, 2, \'Tetrahedra\', 364603, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 35, 0, 35, 0, 2.19486e+06, 'I(3, 2, \'Tetrahedra\', 364603, false, 2, \'Port1 Triangles\', 129, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 667, 0, 665, 0, 8.94207e+06, 'I(6, 1, \'Type\', \'DCS\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 2314239, false, 3, \'Matrix bandwidth\', 21.7341, \'%5.1f\', 2, \'S-matrix only solve\', 1, false, 1, \'Disk\', \'1.63 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 8.94207e+06, 'I(2, 2, \'Excitations\', 1, false, 1, \'Disk\', \'2.34 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2026
						MinorVer=1
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1793208583')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_sym\', 1, \'Matrixdim\', \'2314239\', 1, \'Matrixbw\', \'21.735001\', 1, \'Matrixnnz\', \'50299876\', 1, \'Rootdim\', \'1653\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'win\', 1, \'Cpuid\', \'Intel(R) Xeon(R) W-2133 CPU @ 3.60GHz\', 1, \'CpuPhysicCores\', \'6\', 1, \'CpuLogicCores\', \'12\', 1, \'Cpufreqkhz\', \'3600000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'24.000000\', 1, \'Cpuestgflops\', \'2304.000000\', 1, \'Memorybwestkbps\', \'51.200001\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'137439000000.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'200249\', 1, \'Factornnz\', \'1704195084\', 1, \'Factorestflops\', \'13946600000000\', 1, \'Fbsestflops\', \'5800240000\', 1, \'Rootfactestflops\', \'1505565793\', 1, \'Rootfbsestflops\', \'1366204\', 1, \'Analysistimesec\', \'14.661800\', 1, \'Analysismemkb\', \'1297980.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'651.160000\', 1, \'Factorizationmentotalkb\', \'5747260.000000\')', false, true)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'1\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.004585\', 1, \'Fbscputimesec\', \'0.004585\', 1, \'Fbsmemorytotalkb\', \'5709900.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'5747264\', 1, \'Maxdiskkb\', \'0\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				$begin 'ProfileGroup'
					MajorVer=2026
					MinorVer=1
					Name='Frequency - 39.578125GHz'
					$begin 'StartInfo'
						I(0, 'DTU-CZC946C81R.win.dtu.dk')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:11:48')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #5\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 6, 0, 6, 0, 1.17904e+06, 'I(2, 2, \'Tetrahedra\', 364603, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 35, 0, 35, 0, 2.19331e+06, 'I(3, 2, \'Tetrahedra\', 364603, false, 2, \'Port1 Triangles\', 129, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 665, 0, 663, 0, 8.94358e+06, 'I(6, 1, \'Type\', \'DCS\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 2314239, false, 3, \'Matrix bandwidth\', 21.7341, \'%5.1f\', 2, \'S-matrix only solve\', 1, false, 1, \'Disk\', \'1.64 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 8.94358e+06, 'I(2, 2, \'Excitations\', 1, false, 1, \'Disk\', \'2.34 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2026
						MinorVer=1
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1793208582')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_sym\', 1, \'Matrixdim\', \'2314239\', 1, \'Matrixbw\', \'21.735001\', 1, \'Matrixnnz\', \'50299876\', 1, \'Rootdim\', \'1653\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'win\', 1, \'Cpuid\', \'Intel(R) Xeon(R) W-2133 CPU @ 3.60GHz\', 1, \'CpuPhysicCores\', \'6\', 1, \'CpuLogicCores\', \'12\', 1, \'Cpufreqkhz\', \'3600000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'24.000000\', 1, \'Cpuestgflops\', \'2304.000000\', 1, \'Memorybwestkbps\', \'51.200001\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'137439000000.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'200249\', 1, \'Factornnz\', \'1704195084\', 1, \'Factorestflops\', \'13946600000000\', 1, \'Fbsestflops\', \'5800240000\', 1, \'Rootfactestflops\', \'1505565793\', 1, \'Rootfbsestflops\', \'1366204\', 1, \'Analysistimesec\', \'14.808900\', 1, \'Analysismemkb\', \'1297980.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'649.035000\', 1, \'Factorizationmentotalkb\', \'5747260.000000\')', false, true)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'1\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.004234\', 1, \'Fbscputimesec\', \'0.004234\', 1, \'Fbsmemorytotalkb\', \'5712920.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'5747264\', 1, \'Maxdiskkb\', \'0\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				$begin 'ProfileGroup'
					MajorVer=2026
					MinorVer=1
					Name='Frequency - 37.46875GHz'
					$begin 'StartInfo'
						I(0, 'DTU-CZC946C81R.win.dtu.dk')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:11:48')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #5\')', false, true)
					ProfileItem('Simulation Setup ', 6, 0, 6, 0, 1.17895e+06, 'I(2, 2, \'Tetrahedra\', 364603, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 35, 0, 35, 0, 2.19346e+06, 'I(3, 2, \'Tetrahedra\', 364603, false, 2, \'Port1 Triangles\', 129, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 665, 0, 663, 0, 8.94158e+06, 'I(6, 1, \'Type\', \'DCS\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 2314239, false, 3, \'Matrix bandwidth\', 21.7341, \'%5.1f\', 2, \'S-matrix only solve\', 1, false, 1, \'Disk\', \'1.64 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 8.94158e+06, 'I(2, 2, \'Excitations\', 1, false, 1, \'Disk\', \'2.34 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2026
						MinorVer=1
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1793208582')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_sym\', 1, \'Matrixdim\', \'2314239\', 1, \'Matrixbw\', \'21.735001\', 1, \'Matrixnnz\', \'50299876\', 1, \'Rootdim\', \'1653\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'win\', 1, \'Cpuid\', \'Intel(R) Xeon(R) W-2133 CPU @ 3.60GHz\', 1, \'CpuPhysicCores\', \'6\', 1, \'CpuLogicCores\', \'12\', 1, \'Cpufreqkhz\', \'3600000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'24.000000\', 1, \'Cpuestgflops\', \'2304.000000\', 1, \'Memorybwestkbps\', \'51.200001\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'137439000000.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'200249\', 1, \'Factornnz\', \'1704195084\', 1, \'Factorestflops\', \'13946600000000\', 1, \'Fbsestflops\', \'5800240000\', 1, \'Rootfactestflops\', \'1505565793\', 1, \'Rootfbsestflops\', \'1366204\', 1, \'Analysistimesec\', \'14.670600\', 1, \'Analysismemkb\', \'1297980.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'648.835000\', 1, \'Factorizationmentotalkb\', \'5747260.000000\')', false, true)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'1\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.005193\', 1, \'Fbscputimesec\', \'0.005193\', 1, \'Fbsmemorytotalkb\', \'5710030.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'5747264\', 1, \'Maxdiskkb\', \'0\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 18, Frequency: 27.5546875GHz; S Matrix Error =   0.417%; Secondary solver criterion is not converged\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 19, Frequency: 29.03125GHz; S Matrix Error =   0.344%; Secondary solver criterion is not converged\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 20, Frequency: 39.578125GHz; S Matrix Error =   0.390%; Secondary solver criterion is not converged\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 21, Frequency: 37.46875GHz; S Matrix Error =   0.501%\')', false, true)
				ProfileItem('Data Transfer', 0, 0, 0, 0, 111864, 'I(1, 0, \'Frequency Group #5; Interpolating frequency sweep\')', true, true)
				ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
				$begin 'ProfileGroup'
					MajorVer=2026
					MinorVer=1
					Name='Frequency - 26.7109375GHz'
					$begin 'StartInfo'
						I(0, 'DTU-CZC946C81R.win.dtu.dk')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:11:13')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #6\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 7, 0, 7, 0, 1.17877e+06, 'I(2, 2, \'Tetrahedra\', 364603, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 41, 0, 41, 0, 2.19471e+06, 'I(3, 2, \'Tetrahedra\', 364603, false, 2, \'Port1 Triangles\', 129, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 623, 0, 622, 0, 8.94377e+06, 'I(6, 1, \'Type\', \'DCS\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 2314239, false, 3, \'Matrix bandwidth\', 21.7341, \'%5.1f\', 2, \'S-matrix only solve\', 1, false, 1, \'Disk\', \'1.63 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 8.94377e+06, 'I(2, 2, \'Excitations\', 1, false, 1, \'Disk\', \'2.34 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2026
						MinorVer=1
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1793209279')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_sym\', 1, \'Matrixdim\', \'2314239\', 1, \'Matrixbw\', \'21.735001\', 1, \'Matrixnnz\', \'50299876\', 1, \'Rootdim\', \'1653\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'win\', 1, \'Cpuid\', \'Intel(R) Xeon(R) W-2133 CPU @ 3.60GHz\', 1, \'CpuPhysicCores\', \'6\', 1, \'CpuLogicCores\', \'12\', 1, \'Cpufreqkhz\', \'3600000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'24.000000\', 1, \'Cpuestgflops\', \'2304.000000\', 1, \'Memorybwestkbps\', \'51.200001\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'137439000000.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'200249\', 1, \'Factornnz\', \'1704195084\', 1, \'Factorestflops\', \'13946600000000\', 1, \'Fbsestflops\', \'5800240000\', 1, \'Rootfactestflops\', \'1505565793\', 1, \'Rootfbsestflops\', \'1366204\', 1, \'Analysistimesec\', \'14.745600\', 1, \'Analysismemkb\', \'1297980.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'606.723000\', 1, \'Factorizationmentotalkb\', \'5747260.000000\')', false, true)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'1\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.004580\', 1, \'Fbscputimesec\', \'0.004580\', 1, \'Fbsmemorytotalkb\', \'5711280.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'5747264\', 1, \'Maxdiskkb\', \'0\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				$begin 'ProfileGroup'
					MajorVer=2026
					MinorVer=1
					Name='Frequency - 27.9765625GHz'
					$begin 'StartInfo'
						I(0, 'DTU-CZC946C81R.win.dtu.dk')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:11:13')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #6\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 7, 0, 7, 0, 1.17914e+06, 'I(2, 2, \'Tetrahedra\', 364603, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 41, 0, 40, 0, 2.19742e+06, 'I(3, 2, \'Tetrahedra\', 364603, false, 2, \'Port1 Triangles\', 129, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 624, 0, 622, 0, 8.94097e+06, 'I(6, 1, \'Type\', \'DCS\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 2314239, false, 3, \'Matrix bandwidth\', 21.7341, \'%5.1f\', 2, \'S-matrix only solve\', 1, false, 1, \'Disk\', \'1.64 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 8.94097e+06, 'I(2, 2, \'Excitations\', 1, false, 1, \'Disk\', \'2.34 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2026
						MinorVer=1
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1793209280')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_sym\', 1, \'Matrixdim\', \'2314239\', 1, \'Matrixbw\', \'21.735001\', 1, \'Matrixnnz\', \'50299876\', 1, \'Rootdim\', \'1653\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'win\', 1, \'Cpuid\', \'Intel(R) Xeon(R) W-2133 CPU @ 3.60GHz\', 1, \'CpuPhysicCores\', \'6\', 1, \'CpuLogicCores\', \'12\', 1, \'Cpufreqkhz\', \'3600000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'24.000000\', 1, \'Cpuestgflops\', \'2304.000000\', 1, \'Memorybwestkbps\', \'51.200001\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'137439000000.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'200249\', 1, \'Factornnz\', \'1704195084\', 1, \'Factorestflops\', \'13946600000000\', 1, \'Fbsestflops\', \'5800240000\', 1, \'Rootfactestflops\', \'1505565793\', 1, \'Rootfbsestflops\', \'1366204\', 1, \'Analysistimesec\', \'14.438200\', 1, \'Analysismemkb\', \'1297980.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'607.884000\', 1, \'Factorizationmentotalkb\', \'5747260.000000\')', false, true)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'1\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.004353\', 1, \'Fbscputimesec\', \'0.004353\', 1, \'Fbsmemorytotalkb\', \'5705470.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'5747264\', 1, \'Maxdiskkb\', \'0\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				$begin 'ProfileGroup'
					MajorVer=2026
					MinorVer=1
					Name='Frequency - 39.3671875GHz'
					$begin 'StartInfo'
						I(0, 'DTU-CZC946C81R.win.dtu.dk')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:11:14')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #6\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 7, 0, 7, 0, 1.17903e+06, 'I(2, 2, \'Tetrahedra\', 364603, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 41, 0, 41, 0, 2.19568e+06, 'I(3, 2, \'Tetrahedra\', 364603, false, 2, \'Port1 Triangles\', 129, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 625, 0, 623, 0, 8.94233e+06, 'I(6, 1, \'Type\', \'DCS\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 2314239, false, 3, \'Matrix bandwidth\', 21.7341, \'%5.1f\', 2, \'S-matrix only solve\', 1, false, 1, \'Disk\', \'1.63 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 8.94233e+06, 'I(2, 2, \'Excitations\', 1, false, 1, \'Disk\', \'2.34 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2026
						MinorVer=1
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1793209281')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_sym\', 1, \'Matrixdim\', \'2314239\', 1, \'Matrixbw\', \'21.735001\', 1, \'Matrixnnz\', \'50299876\', 1, \'Rootdim\', \'1653\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'win\', 1, \'Cpuid\', \'Intel(R) Xeon(R) W-2133 CPU @ 3.60GHz\', 1, \'CpuPhysicCores\', \'6\', 1, \'CpuLogicCores\', \'12\', 1, \'Cpufreqkhz\', \'3600000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'24.000000\', 1, \'Cpuestgflops\', \'2304.000000\', 1, \'Memorybwestkbps\', \'51.200001\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'137439000000.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'200249\', 1, \'Factornnz\', \'1704195084\', 1, \'Factorestflops\', \'13946600000000\', 1, \'Fbsestflops\', \'5800240000\', 1, \'Rootfactestflops\', \'1505565793\', 1, \'Rootfbsestflops\', \'1366204\', 1, \'Analysistimesec\', \'14.497600\', 1, \'Analysismemkb\', \'1297980.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'608.296000\', 1, \'Factorizationmentotalkb\', \'5747260.000000\')', false, true)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'1\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.004337\', 1, \'Fbscputimesec\', \'0.004337\', 1, \'Fbsmemorytotalkb\', \'5709500.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'5747264\', 1, \'Maxdiskkb\', \'0\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				$begin 'ProfileGroup'
					MajorVer=2026
					MinorVer=1
					Name='Frequency - 39.7890625GHz'
					$begin 'StartInfo'
						I(0, 'DTU-CZC946C81R.win.dtu.dk')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:11:13')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #6\')', false, true)
					ProfileItem('Simulation Setup ', 7, 0, 7, 0, 1.17895e+06, 'I(2, 2, \'Tetrahedra\', 364603, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 41, 0, 41, 0, 2.19439e+06, 'I(3, 2, \'Tetrahedra\', 364603, false, 2, \'Port1 Triangles\', 129, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 624, 0, 622, 0, 8.94277e+06, 'I(6, 1, \'Type\', \'DCS\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 2314239, false, 3, \'Matrix bandwidth\', 21.7341, \'%5.1f\', 2, \'S-matrix only solve\', 1, false, 1, \'Disk\', \'1.63 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 8.94277e+06, 'I(2, 2, \'Excitations\', 1, false, 1, \'Disk\', \'2.34 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2026
						MinorVer=1
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1793209281')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_sym\', 1, \'Matrixdim\', \'2314239\', 1, \'Matrixbw\', \'21.735001\', 1, \'Matrixnnz\', \'50299876\', 1, \'Rootdim\', \'1653\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'win\', 1, \'Cpuid\', \'Intel(R) Xeon(R) W-2133 CPU @ 3.60GHz\', 1, \'CpuPhysicCores\', \'6\', 1, \'CpuLogicCores\', \'12\', 1, \'Cpufreqkhz\', \'3600000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'24.000000\', 1, \'Cpuestgflops\', \'2304.000000\', 1, \'Memorybwestkbps\', \'51.200001\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'137439000000.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'200249\', 1, \'Factornnz\', \'1704195084\', 1, \'Factorestflops\', \'13946600000000\', 1, \'Fbsestflops\', \'5800240000\', 1, \'Rootfactestflops\', \'1505565793\', 1, \'Rootfbsestflops\', \'1366204\', 1, \'Analysistimesec\', \'14.546600\', 1, \'Analysismemkb\', \'1297980.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'607.672000\', 1, \'Factorizationmentotalkb\', \'5747260.000000\')', false, true)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'1\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.004152\', 1, \'Fbscputimesec\', \'0.004152\', 1, \'Fbsmemorytotalkb\', \'5710400.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'5747264\', 1, \'Maxdiskkb\', \'0\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 22, Frequency: 26.7109375GHz; S Matrix Error =   0.119%; Secondary solver criterion is not converged\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 23, Frequency: 27.9765625GHz; S Matrix Error =   0.134%; Secondary solver criterion is not converged\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 24, Frequency: 39.3671875GHz; S Matrix Error =   0.274%; Secondary solver criterion is not converged\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 25, Frequency: 39.7890625GHz; S Matrix Error =   0.075%; Secondary solver criterion is not converged\')', false, true)
				ProfileItem('Data Transfer', 0, 0, 0, 0, 111892, 'I(1, 0, \'Frequency Group #6; Interpolating frequency sweep\')', true, true)
				ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
				$begin 'ProfileGroup'
					MajorVer=2026
					MinorVer=1
					Name='Frequency - 28.609375GHz'
					$begin 'StartInfo'
						I(0, 'DTU-CZC946C81R.win.dtu.dk')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:10:52')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #7\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 6, 0, 6, 0, 1.17875e+06, 'I(2, 2, \'Tetrahedra\', 364603, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 36, 0, 36, 0, 2.1941e+06, 'I(3, 2, \'Tetrahedra\', 364603, false, 2, \'Port1 Triangles\', 129, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 608, 0, 607, 0, 8.9397e+06, 'I(6, 1, \'Type\', \'DCS\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 2314239, false, 3, \'Matrix bandwidth\', 21.7341, \'%5.1f\', 2, \'S-matrix only solve\', 1, false, 1, \'Disk\', \'1.63 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 8.9397e+06, 'I(2, 2, \'Excitations\', 1, false, 1, \'Disk\', \'2.34 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2026
						MinorVer=1
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1793209952')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_sym\', 1, \'Matrixdim\', \'2314239\', 1, \'Matrixbw\', \'21.735001\', 1, \'Matrixnnz\', \'50299876\', 1, \'Rootdim\', \'1653\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'win\', 1, \'Cpuid\', \'Intel(R) Xeon(R) W-2133 CPU @ 3.60GHz\', 1, \'CpuPhysicCores\', \'6\', 1, \'CpuLogicCores\', \'12\', 1, \'Cpufreqkhz\', \'3600000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'24.000000\', 1, \'Cpuestgflops\', \'2304.000000\', 1, \'Memorybwestkbps\', \'51.200001\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'137439000000.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'200249\', 1, \'Factornnz\', \'1704195084\', 1, \'Factorestflops\', \'13946600000000\', 1, \'Fbsestflops\', \'5800240000\', 1, \'Rootfactestflops\', \'1505565793\', 1, \'Rootfbsestflops\', \'1366204\', 1, \'Analysistimesec\', \'14.657400\', 1, \'Analysismemkb\', \'1297980.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'592.310000\', 1, \'Factorizationmentotalkb\', \'5747260.000000\')', false, true)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'1\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.004450\', 1, \'Fbscputimesec\', \'0.004450\', 1, \'Fbsmemorytotalkb\', \'5707680.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'5747264\', 1, \'Maxdiskkb\', \'0\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				$begin 'ProfileGroup'
					MajorVer=2026
					MinorVer=1
					Name='Frequency - 38.734375GHz'
					$begin 'StartInfo'
						I(0, 'DTU-CZC946C81R.win.dtu.dk')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:10:54')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #7\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 6, 0, 6, 0, 1.17915e+06, 'I(2, 2, \'Tetrahedra\', 364603, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 35, 0, 35, 0, 2.19608e+06, 'I(3, 2, \'Tetrahedra\', 364603, false, 2, \'Port1 Triangles\', 129, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 611, 0, 609, 0, 8.9398e+06, 'I(6, 1, \'Type\', \'DCS\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 2314239, false, 3, \'Matrix bandwidth\', 21.7341, \'%5.1f\', 2, \'S-matrix only solve\', 1, false, 1, \'Disk\', \'1.63 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 8.9398e+06, 'I(2, 2, \'Excitations\', 1, false, 1, \'Disk\', \'2.34 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2026
						MinorVer=1
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1793209954')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_sym\', 1, \'Matrixdim\', \'2314239\', 1, \'Matrixbw\', \'21.735001\', 1, \'Matrixnnz\', \'50299876\', 1, \'Rootdim\', \'1653\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'win\', 1, \'Cpuid\', \'Intel(R) Xeon(R) W-2133 CPU @ 3.60GHz\', 1, \'CpuPhysicCores\', \'6\', 1, \'CpuLogicCores\', \'12\', 1, \'Cpufreqkhz\', \'3600000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'24.000000\', 1, \'Cpuestgflops\', \'2304.000000\', 1, \'Memorybwestkbps\', \'51.200001\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'137439000000.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'200249\', 1, \'Factornnz\', \'1704195084\', 1, \'Factorestflops\', \'13946600000000\', 1, \'Fbsestflops\', \'5800240000\', 1, \'Rootfactestflops\', \'1505565793\', 1, \'Rootfbsestflops\', \'1366204\', 1, \'Analysistimesec\', \'14.640600\', 1, \'Analysismemkb\', \'1297980.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'594.480000\', 1, \'Factorizationmentotalkb\', \'5747260.000000\')', false, true)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'1\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.005357\', 1, \'Fbscputimesec\', \'0.005357\', 1, \'Fbsmemorytotalkb\', \'5705580.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'5747264\', 1, \'Maxdiskkb\', \'0\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				$begin 'ProfileGroup'
					MajorVer=2026
					MinorVer=1
					Name='Frequency - 37.890625GHz'
					$begin 'StartInfo'
						I(0, 'DTU-CZC946C81R.win.dtu.dk')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:10:53')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #7\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 6, 0, 6, 0, 1.17909e+06, 'I(2, 2, \'Tetrahedra\', 364603, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 35, 0, 35, 0, 2.19576e+06, 'I(3, 2, \'Tetrahedra\', 364603, false, 2, \'Port1 Triangles\', 129, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 610, 0, 609, 0, 8.94469e+06, 'I(6, 1, \'Type\', \'DCS\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 2314239, false, 3, \'Matrix bandwidth\', 21.7341, \'%5.1f\', 2, \'S-matrix only solve\', 1, false, 1, \'Disk\', \'1.64 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 8.94469e+06, 'I(2, 2, \'Excitations\', 1, false, 1, \'Disk\', \'2.34 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2026
						MinorVer=1
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1793209954')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_sym\', 1, \'Matrixdim\', \'2314239\', 1, \'Matrixbw\', \'21.735001\', 1, \'Matrixnnz\', \'50299876\', 1, \'Rootdim\', \'1653\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'win\', 1, \'Cpuid\', \'Intel(R) Xeon(R) W-2133 CPU @ 3.60GHz\', 1, \'CpuPhysicCores\', \'6\', 1, \'CpuLogicCores\', \'12\', 1, \'Cpufreqkhz\', \'3600000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'24.000000\', 1, \'Cpuestgflops\', \'2304.000000\', 1, \'Memorybwestkbps\', \'51.200001\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'137439000000.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'200249\', 1, \'Factornnz\', \'1704195084\', 1, \'Factorestflops\', \'13946600000000\', 1, \'Fbsestflops\', \'5800240000\', 1, \'Rootfactestflops\', \'1505565793\', 1, \'Rootfbsestflops\', \'1366204\', 1, \'Analysistimesec\', \'14.455400\', 1, \'Analysismemkb\', \'1297980.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'594.044000\', 1, \'Factorizationmentotalkb\', \'5747260.000000\')', false, true)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'1\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.004372\', 1, \'Fbscputimesec\', \'0.004372\', 1, \'Fbsmemorytotalkb\', \'5710840.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'5747264\', 1, \'Maxdiskkb\', \'0\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				$begin 'ProfileGroup'
					MajorVer=2026
					MinorVer=1
					Name='Frequency - 32.40625GHz'
					$begin 'StartInfo'
						I(0, 'DTU-CZC946C81R.win.dtu.dk')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:10:53')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #7\')', false, true)
					ProfileItem('Simulation Setup ', 6, 0, 6, 0, 1.17862e+06, 'I(2, 2, \'Tetrahedra\', 364603, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 35, 0, 35, 0, 2.1916e+06, 'I(3, 2, \'Tetrahedra\', 364603, false, 2, \'Port1 Triangles\', 129, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 610, 0, 608, 0, 8.9423e+06, 'I(6, 1, \'Type\', \'DCS\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 2314239, false, 3, \'Matrix bandwidth\', 21.7341, \'%5.1f\', 2, \'S-matrix only solve\', 1, false, 1, \'Disk\', \'1.63 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 8.9423e+06, 'I(2, 2, \'Excitations\', 1, false, 1, \'Disk\', \'2.34 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2026
						MinorVer=1
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1793209954')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_sym\', 1, \'Matrixdim\', \'2314239\', 1, \'Matrixbw\', \'21.735001\', 1, \'Matrixnnz\', \'50299876\', 1, \'Rootdim\', \'1653\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'win\', 1, \'Cpuid\', \'Intel(R) Xeon(R) W-2133 CPU @ 3.60GHz\', 1, \'CpuPhysicCores\', \'6\', 1, \'CpuLogicCores\', \'12\', 1, \'Cpufreqkhz\', \'3600000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'24.000000\', 1, \'Cpuestgflops\', \'2304.000000\', 1, \'Memorybwestkbps\', \'51.200001\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'137439000000.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'200249\', 1, \'Factornnz\', \'1704195084\', 1, \'Factorestflops\', \'13946600000000\', 1, \'Fbsestflops\', \'5800240000\', 1, \'Rootfactestflops\', \'1505565793\', 1, \'Rootfbsestflops\', \'1366204\', 1, \'Analysistimesec\', \'14.822300\', 1, \'Analysismemkb\', \'1297980.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'593.377000\', 1, \'Factorizationmentotalkb\', \'5747260.000000\')', false, true)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'1\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.004701\', 1, \'Fbscputimesec\', \'0.004701\', 1, \'Fbsmemorytotalkb\', \'5712600.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'5747264\', 1, \'Maxdiskkb\', \'0\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 26, Frequency: 28.609375GHz; S Matrix Error =   0.094%; Secondary solver criterion is not converged\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 27, Frequency: 38.734375GHz; S Matrix Error =   0.123%; Secondary solver criterion is not converged\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 28, Frequency: 37.890625GHz; S Matrix Error =   0.069%; Secondary solver criterion is not converged\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 29, Frequency: 32.40625GHz; Scattering matrix quantities converged; Passive within tolerance\')', false, true)
				ProfileItem('Data Transfer', 0, 0, 0, 0, 112020, 'I(1, 0, \'Frequency Group #7; Interpolating frequency sweep\')', true, true)
				ProfileFootnote('I(1, 0, \'Interpolating sweep converged and is passive\')', 0)
				ProfileFootnote('I(1, 0, \'HFSS: Distributed Interpolating sweep\')', 0)
			$end 'ProfileGroup'
		$end 'ProfileGroup'
		ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
		$begin 'ProfileGroup'
			MajorVer=2026
			MinorVer=1
			Name='Simulation Summary'
			$begin 'StartInfo'
			$end 'StartInfo'
			$begin 'TotalInfo'
				I(0, ' ')
			$end 'TotalInfo'
			GroupOptions=0
			TaskDataOptions('CPU Time'=8, Memory=8, 'Real Time'=8)
			ProfileItem('Design Validation', 0, 0, 0, 0, 0, 'I(2, 1, \'Elapsed Time\', \'00:00:00\', 1, \'Total Memory\', \'102 MB\')', false, true)
			ProfileItem('Mesh Fusion Preprocessing', 0, 0, 0, 0, 0, 'I(2, 1, \'Elapsed Time\', \'00:00:00\', 1, \'Total Memory\', \'103 MB\')', false, true)
			ProfileItem('Initial Meshing', 0, 0, 0, 0, 0, 'I(2, 1, \'Elapsed Time\', \'00:01:39\', 1, \'Total Memory\', \'1.58 GB\')', false, true)
			ProfileItem('Adaptive Meshing', 0, 0, 0, 0, 0, 'I(5, 1, \'Elapsed Time\', \'00:10:54\', 1, \'Average memory/process\', \'31.7 GB\', 1, \'Max memory/process\', \'31.7 GB\', 2, \'Max number of processes/frequency\', 1, false, 2, \'Total number of cores\', 4, false)', false, true)
			ProfileItem('Frequency Sweep', 0, 0, 0, 0, 0, 'I(5, 1, \'Elapsed Time\', \'01:20:11\', 1, \'Average memory/process\', \'8.53 GB\', 1, \'Max memory/process\', \'8.53 GB\', 2, \'Max number of processes/frequency\', 1, false, 2, \'Total number of cores\', 4, false)', false, true)
			ProfileFootnote('I(3, 2, \'Max solved tets\', 364603, false, 2, \'Max matrix size\', 2314239, false, 1, \'Matrix bandwidth\', \'21.7\')', 0)
		$end 'ProfileGroup'
		ProfileFootnote('I(2, 1, \'Stop Time\', \'10/28/2026 18:52:51\', 1, \'Status\', \'Normal Completion\')', 0)
	$end 'ProfileGroup'
$end 'Profile'
