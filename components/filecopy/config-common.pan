# #
# Software subject to following license(s):
#   Apache 2 License (http://www.opensource.org/licenses/apache2.0)
#   Copyright (c) Responsible Organization
#

# #
# Current developer(s):
#   Charles Loomis <charles.loomis@cern.ch>
#

# 
# #
# filecopy, 17.12.0-rc2, rc2_1, Tue Dec 19 2017
#

unique template components/filecopy/config-common;

include 'components/filecopy/schema';

# Set prefix to root of component configuration.
prefix '/software/components/filecopy';

#'version' = '17.12.0-rc2';
#'package' = 'NCM::Component';

'active' ?= true;
'dispatch' ?= true;
