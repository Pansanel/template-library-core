# #
# Software subject to following license(s):
#   Apache 2 License (http://www.opensource.org/licenses/apache2.0)
#   Copyright (c) Responsible Organization
#

# #
# Current developer(s):
#   Charles Loomis <charles.loomis@cern.ch>
#

# #
# Author(s): Jane SMITH, Joe DOE
#

# #
      # lcgmonjob, 14.5.0-rc8, rc8_1, 20140605-1140
      #

unique template components/lcgmonjob/config-rpm;

include { 'components/lcgmonjob/config-common' };

# Set prefix to root of component configuration.
prefix '/software/components/lcgmonjob';

# Install Quattor configuration module via RPM package.
'/software/packages' = pkg_repl('ncm-lcgmonjob','14.5.0-rc8_1','noarch');
'dependencies/pre' ?= list('spma');

