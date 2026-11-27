Ka-band SGH

- The AUT is vertically polarized in the measurement coordinate system

- Measurements have been compensated for phi-smearing 

- Near-field theta-span in (-120, +120)

- Far-field data in theta = (120, 180] is an artifact of processing and has no physical meaning

- Despite what the header of the files says, the data is NOT directivity but E-field normalized to total radiated power (therefore you need 20*log_10, not 10*log_10 to plot the directivity in dB-scale)

- Losses are calculated analytically using waveguide theory and subtracted from the directivity (in dB)