# #
# Software subject to following license(s):
#   Apache 2 License (http://www.opensource.org/licenses/apache2.0)
#   Copyright (c) Responsible Organization
#

# #
# Current developer(s):
#   Alvaro Simon Garcia <Alvaro.SimonGarcia@UGent.be>
#

# 
# #
# opennebula, 15.12.0, 1, 2016-01-11T14:30:21Z
#

unique template components/opennebula/config;

include { 'components/opennebula/config-common' };
include { 'components/opennebula/config-rpm' };
include { 'components/opennebula/sudo' };
