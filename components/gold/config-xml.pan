# #
# Software subject to following license(s):
#   Apache 2 License (http://www.opensource.org/licenses/apache2.0)
#   Copyright (c) Responsible Organization
#

# #
# Current developer(s):
#   Stijn De Weirdt <stijn.deweirdt@ugent.be>
#

# #
# Author(s): Jane SMITH, Joe DOE
#

# #
# gold, 15.4.0-rc4, rc4_1, 2015-05-27T12:42:33Z
#

unique template components/gold/config-xml;

include { 'components/gold/config-common' };

# Set prefix to root of component configuration.
prefix '/software/components/gold';

# Embed the Quattor configuration module into XML profile.
'code' = file_contents('components/gold/gold.pm'); 
