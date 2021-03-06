# Quickstart controller class for nova neutron (OpenStack Networking)
class quickstack::neutron::controller (
  $admin_email                   = $quickstack::params::admin_email,
  $admin_password                = $quickstack::params::admin_password,
  $ceilometer_metering_secret    = $quickstack::params::ceilometer_metering_secret,
  $ceilometer_user_password      = $quickstack::params::ceilometer_user_password,
  $ceph_cluster_network          = '',
  $ceph_public_network           = '',
  $ceph_fsid                     = '',
  $ceph_images_key               = '',
  $ceph_volumes_key              = '',
  $ceph_mon_host                 = [ ],
  $ceph_mon_initial_members      = [ ],
  $ceph_osd_pool_default_size    = '',
  $ceph_osd_journal_size         = '',
  $cinder_backend_eqlx           = $quickstack::params::cinder_backend_eqlx,
  $cinder_backend_eqlx_name      = $quickstack::params::cinder_backend_eqlx_name,
  $cinder_backend_gluster        = $quickstack::params::cinder_backend_gluster,
  $cinder_backend_gluster_name   = $quickstack::params::cinder_backend_gluster_name,
  $cinder_backend_iscsi          = $quickstack::params::cinder_backend_iscsi,
  $cinder_backend_iscsi_name     = $quickstack::params::cinder_backend_iscsi_name,
  $cinder_backend_netapp         = $quickstack::params::cinder_backend_netapp,
  $cinder_backend_netapp_name    = $quickstack::params::cinder_backend_netapp_name,
  $cinder_backend_nfs            = $quickstack::params::cinder_backend_nfs,
  $cinder_backend_nfs_name       = $quickstack::params::cinder_backend_nfs_name,
  $cinder_backend_rbd            = $quickstack::params::cinder_backend_rbd,
  $cinder_backend_rbd_name       = $quickstack::params::cinder_backend_rbd_name,
  $cinder_db_password            = $quickstack::params::cinder_db_password,
  $cinder_multiple_backends      = $quickstack::params::cinder_multiple_backends,
  $cinder_create_volume_types    = true,
  $cinder_gluster_shares         = $quickstack::params::cinder_gluster_shares,
  $cinder_nfs_shares             = $quickstack::params::cinder_nfs_shares,
  $cinder_nfs_mount_options      = $quickstack::params::cinder_nfs_mount_options,
  $cinder_san_ip                 = $quickstack::params::cinder_san_ip,
  $cinder_san_login              = $quickstack::params::cinder_san_login,
  $cinder_san_password           = $quickstack::params::cinder_san_password,
  $cinder_san_thin_provision     = $quickstack::params::cinder_san_thin_provision,
  $cinder_eqlx_group_name        = $quickstack::params::cinder_eqlx_group_name,
  $cinder_eqlx_pool              = $quickstack::params::cinder_eqlx_pool,
  $cinder_eqlx_use_chap          = $quickstack::params::cinder_eqlx_use_chap,
  $cinder_eqlx_chap_login        = $quickstack::params::cinder_eqlx_chap_login,
  $cinder_eqlx_chap_password     = $quickstack::params::cinder_eqlx_chap_password,
  $cinder_netapp_hostname          = $quickstack::params::cinder_netapp_hostname,
  $cinder_netapp_login             = $quickstack::params::cinder_netapp_login,
  $cinder_netapp_password          = $quickstack::params::cinder_netapp_password,
  $cinder_netapp_server_port       = $quickstack::params::cinder_netapp_server_port,
  $cinder_netapp_storage_family    = $quickstack::params::cinder_netapp_storage_family,
  $cinder_netapp_transport_type    = $quickstack::params::cinder_netapp_transport_type,
  $cinder_netapp_storage_protocol  = $quickstack::params::cinder_netapp_storage_protocol,
  $cinder_netapp_nfs_shares        = $quickstack::params::cinder_netapp_nfs_shares,
  $cinder_netapp_nfs_shares_config = $quickstack::params::cinder_netapp_nfs_shares_config,
  $cinder_netapp_volume_list       = $quickstack::params::cinder_netapp_volume_list,
  $cinder_netapp_vfiler            = $quickstack::params::cinder_netapp_vfiler,
  $cinder_netapp_vserver           = $quickstack::params::cinder_netapp_vserver,
  $cinder_netapp_controller_ips    = $quickstack::params::cinder_netapp_controller_ips,
  $cinder_netapp_sa_password       = $quickstack::params::cinder_netapp_sa_password,
  $cinder_netapp_storage_pools     = $quickstack::params::cinder_netapp_storage_pools,
  $cinder_rbd_pool               = $quickstack::params::cinder_rbd_pool,
  $cinder_rbd_ceph_conf          = $quickstack::params::cinder_rbd_ceph_conf,
  $cinder_rbd_flatten_volume_from_snapshot
                                 = $quickstack::params::cinder_rbd_flatten_volume_from_snapshot,
  $cinder_rbd_max_clone_depth    = $quickstack::params::cinder_rbd_max_clone_depth,
  $cinder_rbd_user               = $quickstack::params::cinder_rbd_user,
  $cinder_rbd_secret_uuid        = $quickstack::params::cinder_rbd_secret_uuid,
  $cinder_user_password          = $quickstack::params::cinder_user_password,
  $cisco_nexus_plugin            = $quickstack::params::cisco_nexus_plugin,
  $cisco_vswitch_plugin          = $quickstack::params::cisco_vswitch_plugin,
  $controller_admin_host         = $quickstack::params::controller_admin_host,
  $controller_priv_host          = $quickstack::params::controller_priv_host,
  $controller_pub_host           = $quickstack::params::controller_pub_host,
  $glance_db_password            = $quickstack::params::glance_db_password,
  $glance_user_password          = $quickstack::params::glance_user_password,
  $glance_backend                = $quickstack::params::glance_backend,
  $glance_rbd_store_user         = $quickstack::params::glance_rbd_store_user,
  $glance_rbd_store_pool         = $quickstack::params::glance_rbd_store_pool,
  #$heat_auth_encrypt_key,
  $heat_cfn                      = $quickstack::params::heat_cfn,
  $heat_cloudwatch               = $quickstack::params::heat_cloudwatch,
  $heat_db_password              = $quickstack::params::heat_db_password,
  $heat_user_password            = $quickstack::params::heat_user_password,
  $horizon_secret_key            = $quickstack::params::horizon_secret_key,
  $keystone_admin_token          = $quickstack::params::keystone_admin_token,
  $keystone_db_password          = $quickstack::params::keystone_db_password,
  $keystonerc                    = true,
  $neutron_metadata_proxy_secret = $quickstack::params::neutron_metadata_proxy_secret,
  $mysql_host                    = $quickstack::params::mysql_host,
  $mysql_root_password           = $quickstack::params::mysql_root_password,
  $neutron_core_plugin           = 'neutron.plugins.ml2.plugin.Ml2Plugin',
  $neutron_conf_additional_params = { default_quota => 'default',
                                      quota_network => 'default',
                                      quota_subnet => 'default',
                                      quota_port => 'default',
                                      quota_security_group => 'default',
                                      quota_security_group_rule  => 'default',
                                      quota_vip => 'default',
                                      quota_pool => 'default',
                                      quota_router => 'default',
                                      quota_floatingip => 'default',
                                      network_auto_schedule => 'default',
                                    },
  $nova_conf_additional_params   = { quota_instances => 'default',
                                     quota_cores => 'default',
                                     quota_ram => 'default',
                                     quota_floating_ips => 'default',
                                     quota_fixed_ips => 'default',
                                     quota_driver => 'default',
                                     },
  $n1kv_plugin_additional_params = { default_policy_profile => 'default-pp',
                                     network_node_policy_profile => 'default-pp',
                                     poll_duration => '10',
                                     http_pool_size => '4',
                                     http_timeout => '120',
                                     firewall_driver => 'neutron.agent.firewall.NoopFirewallDriver',
                                     enable_sync_on_start => 'True',
                                     restrict_policy_profiles => 'False',
                                     },
  $n1kv_vsm_ip                   = '0.0.0.0',
  $n1kv_vsm_password             = undef,
  $neutron_db_password           = $quickstack::params::neutron_db_password,
  $neutron_user_password         = $quickstack::params::neutron_user_password,
  $nexus_config                  = $quickstack::params::nexus_config,
  $nexus_credentials             = $quickstack::params::nexus_credentials,
  $nova_db_password              = $quickstack::params::nova_db_password,
  $nova_user_password            = $quickstack::params::nova_user_password,
  $nova_default_floating_pool    = $quickstack::params::nova_default_floating_pool,
  $ovs_vlan_ranges               = $quickstack::params::ovs_vlan_ranges,
  #added for extra ovs plugin init - moc specific
  $ovs_tunnel_iface              = $quickstack::params::ovs_tunnel_iface,
  $ovs_tunnel_network            = '',
  $ovs_bridge_mappings           = $quickstack::params::ovs_bridge_mappings,
  $ovs_bridge_uplinks            = $quickstack::params::ovs_bridge_uplinks,
  $ovs_vxlan_udp_port            = $quickstack::params::ovs_vxlan_udp_port,
  $ovs_tunnel_types              = $quickstack::params::ovs_tunnel_types,
  # end of extra ovs plugin init variables
  $provider_vlan_auto_create     = $quickstack::params::provider_vlan_auto_create,
  $provider_vlan_auto_trunk      = $quickstack::params::provider_vlan_auto_trunk,
  $enable_tunneling              = $quickstack::params::enable_tunneling,
  $tunnel_id_ranges              = '1:1000',
  $ml2_type_drivers              = ['vxlan', 'flat','vlan','gre','local'],
  $ml2_tenant_network_types      = ['vxlan', 'flat','vlan','gre'],
  $ml2_mechanism_drivers         = ['openvswitch','l2population'],
  $ml2_flat_networks             = ['*'],
  $ml2_network_vlan_ranges       = ['physnet1:1000:2999'],
  $ml2_tunnel_id_ranges          = ['20:100'],
  $ml2_vxlan_group               = '224.0.0.1',
  $ml2_vni_ranges                = ['10:100'],
  $ml2_security_group            = 'true',
  $amqp_provider                 = $quickstack::params::amqp_provider,
  $amqp_host                     = $quickstack::params::amqp_host,
  $amqp_username                 = $quickstack::params::amqp_username,
  $amqp_password                 = $quickstack::params::amqp_password,
  $security_group_api		 = 'neutron',
  $swift_shared_secret           = $quickstack::params::swift_shared_secret,
  $swift_admin_password          = $quickstack::params::swift_admin_password,
  $swift_ringserver_ip           = '192.168.203.1',
  $swift_storage_ips             = ['192.168.203.2', '192.168.203.3', '192.168.203.4'],
  $swift_storage_device          = 'device1',
  $tenant_network_type           = $quickstack::params::tenant_network_type,
  $verbose                       = $quickstack::params::verbose,
  $ssl                           = $quickstack::params::ssl,
  $freeipa                       = $quickstack::params::freeipa,
  $mysql_ssl                     = $quickstack::params::mysql_ssl,
  $amqp_ssl                      = $quickstack::params::amqp_ssl,
  $horizon_ssl                   = $quickstack::params::horizon_ssl,
  $mysql_ca                      = $quickstack::params::mysql_ca,
  $mysql_cert                    = $quickstack::params::mysql_cert,
  $mysql_key                     = $quickstack::params::mysql_key,
  $amqp_ca                       = $quickstack::params::amqp_ca,
  $amqp_cert                     = $quickstack::params::amqp_cert,
  $amqp_key                      = $quickstack::params::amqp_key,
  $horizon_ca                    = $quickstack::params::horizon_ca,
  $horizon_cert                  = $quickstack::params::horizon_cert,
  $horizon_key                   = $quickstack::params::horizon_key,
  $amqp_nssdb_password           = $quickstack::params::amqp_nssdb_password,
  $network_device_mtu            = $quickstack::params::network_device_mtu,
  $veth_mtu                      = $quickstack::params::veth_mtu,
  $use_ssl                       = $quickstack::params::use_ssl_endpoints,
  $cert_file                     = $quickstack::params::neutron_cert,
  $key_file                      = $quickstack::params::neutron_key,
  $ca_file                       = $quickstack::params::root_ca_cert,
  $neutron_pub_url               = $quickstack::params::neutron_pub_url,
  $keystone_admin_url            = $quickstack::params::keystone_admin_url,
  $auth_uri                      = $quickstack::params::auth_uri,
  $identity_uri                  = $quickstack::params::identity_uri,
  $ovs_l2_population             = 'true',
) inherits quickstack::params {

  if hiera('moc::clusterdeployment') == 'true' {
    $l3_ha                            = 'True'
    $dhcp_agents_per_network          = '2'
    $allow_automatic_l3agent_failover = 'True'
  } else {
    $l3_ha                            = 'False'
    $dhcp_agents_per_network          = '1'
    $allow_automatic_l3agent_failover = 'False'
  }

  if str2bool_i("$use_ssl") {
    $auth_protocol = 'https'
  } else {
    $auth_protocol = 'http'
  }

  if str2bool_i("$ssl") {
    if str2bool_i("$amqp_ssl") {
      $qpid_protocol = 'ssl'
      $amqp_port = '5671'
    } else {
      $qpid_protocol = 'tcp'
      $amqp_port = '5672'
    }

    if str2bool_i("$mysql_ssl"){
      $sql_connection = "mysql://neutron:${neutron_db_password}@${mysql_host}/neutron?ssl_ca=${mysql_ca}"
    } else {
      $sql_connection = "mysql://neutron:${neutron_db_password}@${mysql_host}/neutron"
    }
  } else {
    $qpid_protocol = 'tcp'
    $amqp_port = '5672'
    $sql_connection = "mysql://neutron:${neutron_db_password}@${mysql_host}/neutron"
  }

  class { 'quickstack::controller_common':
    admin_email                   => $admin_email,
    admin_password                => $admin_password,
    ceilometer_metering_secret    => $ceilometer_metering_secret,
    ceilometer_user_password      => $ceilometer_user_password,
    ceph_cluster_network          => $ceph_cluster_network,
    ceph_public_network           => $ceph_public_network,
    ceph_fsid                     => $ceph_fsid,
    ceph_images_key               => $ceph_images_key,
    ceph_volumes_key              => $ceph_volumes_key,
    ceph_mon_host                 => $ceph_mon_host,
    ceph_mon_initial_members      => $ceph_mon_initial_members,
    ceph_osd_pool_default_size    => $ceph_osd_pool_default_size,
    ceph_osd_journal_size         => $ceph_osd_journal_size,
    cinder_backend_eqlx           => $cinder_backend_eqlx,
    cinder_backend_eqlx_name      => $cinder_backend_eqlx_name,
    cinder_backend_gluster        => $cinder_backend_gluster,
    cinder_backend_gluster_name   => $cinder_backend_gluster_name,
    cinder_backend_iscsi          => $cinder_backend_iscsi,
    cinder_backend_iscsi_name     => $cinder_backend_iscsi_name,
    cinder_backend_netapp         => $cinder_backend_netapp,
    cinder_backend_netapp_name    => $cinder_backend_netapp_name,
    cinder_backend_nfs            => $cinder_backend_nfs,
    cinder_backend_nfs_name       => $cinder_backend_nfs_name,
    cinder_backend_rbd            => $cinder_backend_rbd,
    cinder_backend_rbd_name       => $cinder_backend_rbd_name,
    cinder_db_password            => $cinder_db_password,
    cinder_multiple_backends      => $cinder_multiple_backends,
    cinder_create_volume_types    => $cinder_create_volume_types,
    cinder_gluster_shares         => $cinder_gluster_shares,
    cinder_nfs_shares             => $cinder_nfs_shares,
    cinder_nfs_mount_options      => $cinder_nfs_mount_options,
    cinder_san_ip                 => $cinder_san_ip,
    cinder_san_login              => $cinder_san_login,
    cinder_san_password           => $cinder_san_password,
    cinder_san_thin_provision     => $cinder_san_thin_provision,
    cinder_eqlx_group_name        => $cinder_eqlx_group_name,
    cinder_eqlx_pool              => $cinder_eqlx_pool,
    cinder_eqlx_use_chap          => $cinder_eqlx_use_chap,
    cinder_eqlx_chap_login        => $cinder_eqlx_chap_login,
    cinder_eqlx_chap_password     => $cinder_eqlx_chap_password,
    cinder_netapp_hostname          => $cinder_netapp_hostname,
    cinder_netapp_login             => $cinder_netapp_login,
    cinder_netapp_password          => $cinder_netapp_password,
    cinder_netapp_server_port       => $cinder_netapp_server_port,
    cinder_netapp_storage_family    => $cinder_netapp_storage_family,
    cinder_netapp_transport_type    => $cinder_netapp_transport_type,
    cinder_netapp_storage_protocol  => $cinder_netapp_storage_protocol,
    cinder_netapp_nfs_shares        => $cinder_netapp_nfs_shares,
    cinder_netapp_nfs_shares_config => $cinder_netapp_nfs_shares_config,
    cinder_netapp_volume_list       => $cinder_netapp_volume_list,
    cinder_netapp_vfiler            => $cinder_netapp_vfiler,
    cinder_netapp_vserver           => $cinder_netapp_vserver,
    cinder_netapp_controller_ips    => $cinder_netapp_controller_ips,
    cinder_netapp_sa_password       => $cinder_netapp_sa_password,
    cinder_netapp_storage_pools     => $cinder_netapp_storage_pools,
    cinder_rbd_pool               => $cinder_rbd_pool,
    cinder_rbd_ceph_conf          => $cinder_rbd_ceph_conf,
    cinder_rbd_flatten_volume_from_snapshot
                                   => $cinder_rbd_flatten_volume_from_snapshot,
    cinder_rbd_max_clone_depth     => $cinder_rbd_max_clone_depth,
    cinder_rbd_user                => $cinder_rbd_user,
    cinder_rbd_secret_uuid         => $cinder_rbd_secret_uuid,
    cinder_user_password           => $cinder_user_password,
    controller_admin_host          => $controller_admin_host,
    controller_priv_host           => $controller_priv_host,
    controller_pub_host            => $controller_pub_host,
    glance_db_password             => $glance_db_password,
    glance_user_password           => $glance_user_password,
    glance_backend                 => $glance_backend,
    glance_rbd_store_user          => $glance_rbd_store_user,
    glance_rbd_store_pool          => $glance_rbd_store_pool,
    #heat_auth_encrypt_key          => $heat_auth_encrypt_key,
    heat_cfn                       => $heat_cfn,
    heat_cloudwatch                => $heat_cloudwatch,
    heat_db_password               => $heat_db_password,
    heat_user_password             => $heat_user_password,
    horizon_secret_key             => $horizon_secret_key,
    keystone_admin_token           => $keystone_admin_token,
    keystone_db_password           => $keystone_db_password,
    keystonerc                     => $keystonerc,
    neutron_metadata_proxy_secret  => $neutron_metadata_proxy_secret,
    mysql_host                     => $mysql_host,
    mysql_root_password            => $mysql_root_password,
    neutron                        => true,
    neutron_core_plugin            => $neutron_core_plugin,
    neutron_db_password            => $neutron_db_password,
    neutron_user_password          => $neutron_user_password,
    nova_db_password               => $nova_db_password,
    nova_user_password             => $nova_user_password,
    nova_default_floating_pool     => $nova_default_floating_pool,
    amqp_host                      => $amqp_host,
    amqp_username                  => $amqp_username,
    amqp_password                  => $amqp_password,
    amqp_provider                  => $amqp_provider,
    swift_shared_secret            => $swift_shared_secret,
    swift_admin_password           => $swift_admin_password,
    swift_ringserver_ip            => $swift_ringserver_ip,
    swift_storage_ips              => $swift_storage_ips,
    swift_storage_device           => $swift_storage_device,
    verbose                        => $verbose,
    ssl                            => $ssl,
    mysql_ssl                      => $mysql_ssl,
    amqp_ssl                       => $amqp_ssl,
    horizon_ssl                    => $horizon_ssl,
    freeipa                        => $freeipa,
    mysql_ca                       => $mysql_ca,
    mysql_cert                     => $mysql_cert,
    mysql_key                      => $mysql_key,
    amqp_ca                        => $amqp_ca,
    amqp_cert                      => $amqp_cert,
    amqp_key                       => $amqp_key,
    horizon_ca                     => $horizon_ca,
    horizon_cert                   => $horizon_cert,
    horizon_key                    => $horizon_key,
    amqp_nssdb_password            => $amqp_nssdb_password,
  }
  ->
  class { '::neutron':
    enabled                 => true,
    verbose                 => $verbose,
    allow_overlapping_ips   => true,
    rpc_backend             => amqp_backend('neutron', $amqp_provider),
    qpid_hostname           => $amqp_host,
    qpid_port               => $amqp_port,
    qpid_protocol           => $qpid_protocol,
    qpid_username           => $amqp_username,
    qpid_password           => $amqp_password,
    rabbit_host             => $amqp_host,
    rabbit_port             => $amqp_port,
    rabbit_user             => $amqp_username,
    rabbit_password         => $amqp_password,
    rabbit_use_ssl          => $amqp_ssl,
    core_plugin             => $neutron_core_plugin,
    network_device_mtu      => $network_device_mtu,
    use_ssl                 => $use_ssl,
    cert_file               => $cert_file,
    key_file                => $key_file,
    ca_file                 => $ca_file,
    dhcp_agents_per_network => $dhcp_agents_per_network,
  }
  ->
  class { '::nova::network::neutron':
    neutron_admin_password => $neutron_user_password,
    security_group_api     => $security_group_api,
    neutron_url            => $neutron_pub_url,
    neutron_admin_auth_url => "${keystone_admin_url}/v2.0",
  }
  ->
  class { '::neutron::server::notifications':
    notify_nova_on_port_status_changes => true,
    notify_nova_on_port_data_changes   => true,
    nova_url                           => "${auth_protocol}://${controller_priv_host}:8774/v2",
    nova_admin_auth_url                => "${auth_protocol}://${controller_priv_host}:35357/v2.0",
    nova_admin_username                => "nova",
    nova_admin_password                => "${nova_user_password}",
  }
  ->
  # FIXME: This really should be handled by the neutron-puppet module, which has
  # a review request open right now: https://review.openstack.org/#/c/50162/
  # If and when that is merged (or similar), the below can be removed.
  exec { 'neutron-db-manage upgrade':
    command     => 'neutron-db-manage --config-file /etc/neutron/neutron.conf --config-file /etc/neutron/plugin.ini upgrade head',
    path        => '/usr/bin',
    user        => 'neutron',
    logoutput   => 'on_failure',
    before      => Service['neutron-server'],
    require     => [Neutron_config['database/connection'], Neutron_config['DEFAULT/core_plugin']],
  }

  class { '::neutron::server':
    auth_uri                         => $auth_uri,
    identity_uri                     => $identity_uri,
    auth_password                    => $neutron_user_password,
    l3_ha                            => str2bool_i($l3_ha),
    allow_automatic_l3agent_failover => str2bool_i($allow_automatic_l3agent_failover),
  }

  if $neutron_core_plugin == 'neutron.plugins.ml2.plugin.Ml2Plugin' {

    neutron_config {
      'DEFAULT/service_plugins':
        value => join(['neutron.services.l3_router.l3_router_plugin.L3RouterPlugin',]),
    }
    ->
    class { '::neutron::plugins::ml2':
      type_drivers          => $ml2_type_drivers,
      tenant_network_types  => $ml2_tenant_network_types,
      mechanism_drivers     => $ml2_mechanism_drivers,
      flat_networks         => $ml2_flat_networks,
      network_vlan_ranges   => $ml2_network_vlan_ranges,
      tunnel_id_ranges      => $ml2_tunnel_id_ranges,
      vxlan_group           => $ml2_vxlan_group,
      vni_ranges            => $ml2_vni_ranges,
      enable_security_group => str2bool_i("$ml2_security_group"),
    }

    # If cisco nexus is part of ml2 mechanism drivers,
    # setup Mech Driver Cisco Neutron plugin class.
    if ('cisco_nexus' in $ml2_mechanism_drivers) {
      class { 'neutron::plugins::ml2::cisco::nexus':
        nexus_config        => $nexus_config,
      }
    }
  }

  class {'quickstack::neutron::plugins::neutron_config':
    neutron_conf_additional_params => $neutron_conf_additional_params,
  }
 
  class {'quickstack::neutron::plugins::nova_config':
    nova_conf_additional_params => $nova_conf_additional_params,
  }

  if $neutron_core_plugin == 'neutron.plugins.cisco.network_plugin.PluginV2' {
    class { 'quickstack::neutron::plugins::cisco':
      controller_priv_host         => $controller_priv_host,
      cisco_vswitch_plugin         => $cisco_vswitch_plugin,
      cisco_nexus_plugin           => $cisco_nexus_plugin,
      controller_pub_host          => $controller_pub_host,
      n1kv_vsm_ip                  => $n1kv_vsm_ip,
      n1kv_vsm_password            => $n1kv_vsm_password,
      n1kv_plugin_additional_params => $n1kv_plugin_additional_params,
      neutron_db_password          => $neutron_db_password,
      neutron_user_password        => $neutron_user_password,
      neutron_core_plugin          => $neutron_core_plugin,
      nexus_config                 => $nexus_config,
      nexus_credentials            => $nexus_credentials,
      mysql_host                   => $mysql_host,
      mysql_ca                     => $mysql_ca,
      ovs_vlan_ranges              => $ovs_vlan_ranges,
      provider_vlan_auto_create    => $provider_vlan_auto_create,
      provider_vlan_auto_trunk     => $provider_vlan_auto_trunk,
      tenant_network_type          => $tenant_network_type,
    }
  }

  $local_ip = find_ip("$ovs_tunnel_network","$ovs_tunnel_iface","")

  class { '::neutron::agents::ml2::ovs':
    bridge_uplinks   => $ovs_bridge_uplinks,
    local_ip         => $local_ip,
    bridge_mappings  => $ovs_bridge_mappings,
    enable_tunneling => str2bool_i("$enable_tunneling"),
    tunnel_types     => $ovs_tunnel_types,
    vxlan_udp_port   => $ovs_vxlan_udp_port,
    l2_population    => $ovs_l2_population,
  }

  class { '::neutron::agents::dhcp': }

  class { '::neutron::agents::l3':
    external_network_bridge => $external_network_bridge,
  }

  class { 'neutron::agents::metadata':
    auth_password => $neutron_user_password,
    shared_secret => $neutron_metadata_proxy_secret,
    auth_url      => "${auth_protocol}://${controller_priv_host}:5000/v2.0",
    metadata_ip   => $controller_priv_host,
  }

  if str2bool_i("$lbaas") {
    class { 'neutron::agents::lbaas': }
  }

  if str2bool_i("$fwaas") {
    class { 'neutron::services::fwaas': }  
  }

  if str2bool_i("$vpnaas") {
    class { 'neutron::agents::vpnaas': }
  }

  if str2bool_i("$neutron_metering_agent") {
    class { 'neutron::agents::metering': }
  } 

#  class {'quickstack::neutron::firewall::gre': }

#  class {'quickstack::neutron::firewall::vxlan':
#    port => $ovs_vxlan_udp_port,
#  }

#  firewall { '001 neutron server (API)':
#    proto    => 'tcp',
#    dport    => ['9696'],
#    action   => 'accept',
#  }
#
  class {'moc_config::server_config':}

  # Add dnsmasq-neutron.conf for MTU specification
  class {'moc_openstack::dnsmasq_neutron':
    require => Class['::neutron'],
    notify  => Class['::neutron::agents::dhcp'],
  }
}
