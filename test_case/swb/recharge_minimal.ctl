GRID  30  30  2165054       255067        2169887       259900      161.1
GRID_LENGTH_UNITS FEET
GROWING_SEASON 133 268 TRUE
ANSI_COLORS FALSE
RLE_MULTIPLIER 10000
PRECIPITATION SINGLE_STATION
TEMPERATURE SINGLE_STATION
OUTPUT_GRID_SUFFIX asc
INITIAL_ABSTRACTION_METHOD HAWKINS
INITIAL_FROZEN_GROUND_INDEX CONSTANT 100.0
UPPER_LIMIT_CFGI 83.
LOWER_LIMIT_CFGI 55.
FLOW_DIRECTION ARC_GRID input\flowdircoarse_esri.asc
SOIL_GROUP ARC_GRID input\hsgCoarse.asc
LAND_USE ARC_GRID input\lulcCoarse.asc
LAND_USE_LOOKUP_TABLE std_input\LU_LOOKUP.txt
WATER_CAPACITY ARC_GRID input\awcCoarse.asc
SM T-M std_input\soil-moisture-retention-extended.grd
INITIAL_SOIL_MOISTURE CONSTANT 100
INITIAL_SNOW_COVER CONSTANT 0
RUNOFF C-N DOWNHILL
ET T-M 43
OUTPUT_OPTIONS RECHARGE NONE NONE PLOT
OUTPUT_FORMAT ARC_GRID
SOLVE climate\Coshocton_Climate_1999.txt
SOLVE climate\Coshocton_Climate_2000.txt
SOLVE climate\Coshocton_Climate_2001.txt
SOLVE climate\Coshocton_Climate_2002.txt
SOLVE climate\Coshocton_Climate_2003.txt
EOJ
