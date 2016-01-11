# #
# Software subject to following license(s):
#   Apache 2 License (http://www.opensource.org/licenses/apache2.0)
#   Copyright (c) Responsible Organization
#

# #
# Current developer(s):
#   Thorsten Kleinwort <Thorsten.Kleinwort@cern.ch>
#

# #
# Author(s): John Monteiro
#

# #
# ntpd, 15.12.0, 1, 2016-01-11T14:30:21Z
#

unique template components/ntpd/config;

include 'components/ntpd/schema';

bind "/software/components/ntpd" = component_ntpd_type;

"/software/packages" = pkg_repl("ncm-ntpd", "15.12.0-1", "noarch");

prefix '/software/components/ntpd';
'active' ?= true;
'dispatch' ?= true;
'version' ?= '15.12.0';
'dependencies/pre' ?= list("spma");
