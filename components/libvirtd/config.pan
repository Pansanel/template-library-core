# #
# Software subject to following license(s):
#   Apache 2 License (http://www.opensource.org/licenses/apache2.0)
#   Copyright (c) Centre National de la Recherche Scientifique
#

# #
# Current developer(s):
#   Charles LOOMIS <loomis@lal.in2p3.fr>
#

# 
# #
# libvirtd, 17.12.0-rc2, rc2_1, Tue Dec 19 2017
#

unique template components/libvirtd/config;

include 'components/libvirtd/schema';

'/software/packages'=pkg_repl('ncm-libvirtd','17.12.0-rc2_1','noarch');
'/software/components/libvirtd/dependencies/pre' ?=  list ('spma');

'/software/components/libvirtd/active' ?= true;
'/software/components/libvirtd/dispatch' ?= true;
