# #
# Software subject to following license(s):
#   Apache 2 License (http://www.opensource.org/licenses/apache2.0)
#   Copyright (c) Responsible Organization
#

# #
# Current developer(s):
#   Stijn De Weirdt <stijn.deweirdt@ugent.be>
#   Alvaro Simon Garcia <Alvaro.SimonGarcia@UGent.be>
#

# 


declaration template components/openstack/common;

type type_storagebackend = string with match(SELF, '^(file|http|swift|rbd|sheepdog|cinder|vmware)$');

type type_neutrondriver = string with match(SELF, '^(local|flat|vlan|gre|vxlan|geneve)$');

type type_neutronextension = string with match(SELF, '^(qos|port_security)$');

type type_directory = string with match(SELF, '[^/]+/?$');

@documentation {
    OpenStack common domains section
}
type openstack_domains_common = {
    @{Domain name containing project}
    'project_domain_name' : string = 'Default'
    @{Project name to scope to}
    'project_name' : string = 'service'
    @{The type of authentication credential to create.
    Required if no context is passed to the credential factory}
    'auth_type' : string = 'password' with match (SELF, '^(password|token|keystone_token|keystone_password)$')
    @{Users domain name}
    'user_domain_name' : string = 'Default'
    @{Keystone authentication URL http(s)://host:port}
    'auth_url' : type_absoluteURI
    @{OpenStack service username}
    'username' : string
    @{OpenStack service user password}
    'password' : string
} = dict();

@documentation {
    The configuration options in the database Section
}
type openstack_database = {
    @{The SQLAlchemy connection string to use to connect to the database}
    'connection' : string
};

@documentation {
    The configuration options in 'oslo_concurrency' Section.
}
type openstack_oslo_concurrency = {
    @{Directory to use for lock files.  For security, the specified directory should
    only be writable by the user running the processes that need locking. Defaults
    to environment variable OSLO_LOCK_PATH. If external locks are used, a lock
    path must be set}
    'lock_path' : type_directory
};

@documentation {
    The configuration options in the DEFAULTS Section
}
type openstack_DEFAULTS = {
    @{Using this feature is *NOT* recommended. Instead, use the "keystone-manage 
    bootstrap" command. The value of this option is treated as a "shared secret"
    that can be used to bootstrap Keystone through the API. This "token" does not
    represent a user (it has no identity), and carries no explicit authorization
    (it effectively bypasses most authorization checks). If set to "None", the
    value is ignored and the "admin_token" middleware is effectively disabled.
    However, to completely disable "admin_token" in production (highly
    recommended, as it presents a security risk), remove
    AdminTokenAuthMiddleware (the "admin_token_auth" filter) from your paste
    application pipelines (for example, in "keystone-paste.ini")}
    'admin_token' ? string
    'notifications' ? string
    @{From oslo.log
    If set to true, the logging level will be set to DEBUG instead of the default
    INFO level.
    Note: This option can be changed without restarting}
    'debug' ? boolean
    @{Use syslog for logging. Existing syslog format is DEPRECATED and will be
    changed later to honor RFC5424. This option is ignored if log_config_append
    is set}
    'use_syslog' ? boolean
    @{Syslog facility to receive log lines. This option is ignored if
    log_config_append is set}
    'syslog_log_facility' ? string
    @{From nova.conf
    This determines the strategy to use for authentication: keystone or noauth2.
    "noauth2" is designed for testing only, as it does no actual credential
    checking. "noauth2" provides administrative credentials only if "admin" is
    specified as the username}
    'auth_strategy' ? string = 'keystone' with match (SELF, '^(keystone|noauth2)$')
    @{From nova.conf
    The IP address which the host is using to connect to the management network.
    Default is IPv4 address of this host}
    'my_ip' ? type_ip
    @{From nova.conf
    List of APIs to be enabled by default}
    'enabled_apis' ? string[] = list('osapi_compute', 'metadata')
    @{From nova.conf
    An URL representing the messaging driver to use and its full configuration.
    Example: rabbit://openstack:<rabbit_password>@<fqdn>
    }
    'transport_url' ? string
    @{Path to the rootwrap configuration file.

    Goal of the root wrapper is to allow a service-specific unprivileged user to
    run a number of actions as the root user in the safest manner possible.
    The configuration file used here must match the one defined in the sudoers
    entry.

    Be sure to include into sudoers these lines:
        nova ALL = (root) NOPASSWD: /usr/bin/nova-rootwrap /etc/nova/rootwrap.conf *
    more info https://wiki.openstack.org/wiki/Rootwrap}
    'rootwrap_config' ? absolute_file_path
    @{From neutron.conf
    The core plugin Neutron will use}
    'core_plugin' ? string = 'ml2'
    @{From neutron.conf
    The service plugins Neutron will use}
    'service_plugins' ? string[] = list('router')
    @{From neutron.conf
    Allow overlapping IP support in Neutron. Attention: the following parameter
    MUST be set to False if Neutron is being used in conjunction with Nova
    security groups}
    'allow_overlapping_ips' ? boolean = true
    @{From neutron.conf
    Send notification to nova when port status changes}
    'notify_nova_on_port_status_changes' ? boolean = true
    @{From neutron.conf
    Send notification to nova when port data (fixed_ips/floatingip) changes so
    nova can update its cache}
    'notify_nova_on_port_data_changes' ? boolean = true
    @{From Neutron l3_agent.ini and dhcp_agent.ini
    The driver used to manage the virtual interface}
    'interface_driver' ? string = 'linuxbridge'
    @{From Neutron dhcp_agent.ini
    The driver used to manage the DHCP server}
    'dhcp_driver' ? string = 'neutron.agent.linux.dhcp.Dnsmasq'
    @{From Neutron dhcp_agent.ini
    The DHCP server can assist with providing metadata support on isolated
    networks. Setting this value to True will cause the DHCP server to append
    specific host routes to the DHCP request. The metadata service will only be
    activated when the subnet does not contain any router port. The guest
    instance must be configured to request host routes via DHCP (Option 121).
    This option does not have any effect when force_metadata is set to True}
    'enable_isolated_metadata' ? boolean = true
    @{From Neutron metadata_agent.ini
    IP address or hostname used by Nova metadata server}
    'nova_metadata_ip' ? string
    @{From Neutron metadata_agent.ini
    When proxying metadata requests, Neutron signs the Instance-ID header with a
    shared secret to prevent spoofing. You may select any string for a secret,
    but it must match here and in the configuration used by the Nova Metadata
    Server. NOTE: Nova uses the same config key, but in [neutron] section.
    }
    'metadata_proxy_shared_secret' ? string
} = dict();
