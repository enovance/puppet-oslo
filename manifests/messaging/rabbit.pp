#
# Copyright (C) 2015 Red Hat
#
# Author: Emilien Macchi <emilien@redhat.com>
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License. You may obtain
# a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations
# under the License.
#
# == Definition: oslo::messaging::rabbit
#
# This resource configures Oslo Messaging RabbitMQ resources for an OpenStack
# service.  It will manage the [oslo_messaging_rabbit] section in the given
# config resource.  It supports all of the authentication parameters specified
# in Oslo Messaging for Rabbit driver.
#
# == Parameters:
#
# [*name*]
#   The name of the resource corresponding to the config file.  For example,
#   oslo::messaging { 'nova_config': ... }
#   Where 'nova_config' is the name of the resource used to manage
#   the nova configuration.
#   string; required
#
# [*kombu_ssl_version*]
#   SSL version to use (valid only if SSL enabled).
#   Valid values are TLSv1 and SSLv23. SSLv2, SSLv3,
#   TLSv1_1, and TLSv1_2 may be available on some distributions.
#   string; optional: default to undef
#
# [*kombu_ssl_keyfile*]
#   SSL key file (valid only if SSL enabled).
#   string; optional: default to undef
#
# [*kombu_ssl_certfile*]
#   SSL cert file (valid only if SSL enabled).
#   string; optional: default to undef
#
# [*kombu_ssl_ca_certs*]
#   SSL certification authority file (valid only if SSL enabled).
#   string; optional: default to undef
#
# [*kombu_reconnect_delay*]
#   How long to wait before reconnecting in response to an
#   AMQP consumer cancel notification.
#   string; optional: default to undef
#
# [*rabbit_host*]
#   The RabbitMQ broker address where a single node is used.
#   string; optional: default to undef
#
# [*rabbit_port*]
#   The RabbitMQ broker port where a single node is used.
#   string; optional: default to undef
#
# [*rabbit_hosts*]
#   RabbitMQ HA cluster host:port pairs.
#   Should be an array.
#   string; optional: default to undef
#
# [*rabbit_use_ssl*]
#   Connect over SSL for RabbitMQ.
#   string; optional: default to undef
#
# [*rabbit_userid*]
#   The RabbitMQ userid.
#   string; optional: default to undef
#
# [*rabbit_password*]
#   The RabbitMQ password.
#   string; optional: default to undef
#
# [*rabbit_login_method*]
#   The RabbitMQ login method.
#   string; optional: default to undef
#
# [*rabbit_virtual_host*]
#   The RabbitMQ virtual host.
#   string; optional: default to undef
#
# [*rabbit_retry_interval*]
#   How frequently to retry connecting with RabbitMQ.
#   string; optional: default to undef
#
# [*rabbit_retry_backoff*]
#   How long to backoff for between retries when connecting to RabbitMQ.
#   string; optional: default to undef
#
# [*rabbit_max_retries*]
#   Maximum number of RabbitMQ connection retries.
#   0 means infinite retry count.
#   string; optional: default to undef
#
# [*rabbit_ha_queues*]
#   Use HA queues in RabbitMQ (x-ha-policy: all).
#   If you change this option, you must wipe the
#   RabbitMQ database.
#   string; optional: default to undef
#
# [*heartbeat_timeout_threshold*]
#   Number of seconds after which the Rabbit broker is
#   considered down if heartbeat's keep-alive fails
#   O disable the heartbeat. EXPERIMENTAL.
#   string; optional: default to undef
#
# [*heartbeat_rate*]
#   How often times during the heartbeat_timeout_threshold
#   we check the heartbeat.
#   string; optional: default to undef
#
define oslo::messaging::rabbit(
  $kombu_ssl_version           = undef,
  $kombu_ssl_keyfile           = undef,
  $kombu_ssl_certfile          = undef,
  $kombu_ssl_ca_certs          = undef,
  $kombu_reconnect_delay       = undef,
  $rabbit_host                 = undef,
  $rabbit_port                 = undef,
  $rabbit_hosts                = undef,
  $rabbit_use_ssl              = undef,
  $rabbit_userid               = undef,
  $rabbit_password             = undef,
  $rabbit_login_method         = undef,
  $rabbit_virtual_host         = undef,
  $rabbit_retry_interval       = undef,
  $rabbit_retry_backoff        = undef,
  $rabbit_max_retries          = undef,
  $rabbit_ha_queues            = undef,
  $heartbeat_timeout_threshold = undef,
  $heartbeat_rate              = undef,
) {


  if $kombu_ssl_version {
    ensure_resource($name, 'oslo_messaging_rabbit/kombu_ssl_version', {'value' => $kombu_ssl_version})
  } else {
    ensure_resource($name, 'oslo_messaging_rabbit/kombu_ssl_version', {'ensure' => 'absent'})
  }

  if $kombu_ssl_keyfile {
    ensure_resource($name, 'oslo_messaging_rabbit/kombu_ssl_keyfile', {'value' => $kombu_ssl_keyfile})
  } else {
    ensure_resource($name, 'oslo_messaging_rabbit/kombu_ssl_keyfile', {'ensure' => 'absent'})
  }

  if $kombu_ssl_certfile {
    ensure_resource($name, 'oslo_messaging_rabbit/kombu_ssl_certfile', {'value' => $kombu_ssl_certfile})
  } else {
    ensure_resource($name, 'oslo_messaging_rabbit/kombu_ssl_certfile', {'ensure' => 'absent'})
  }

  if $kombu_ssl_ca_certs {
    ensure_resource($name, 'oslo_messaging_rabbit/kombu_ssl_ca_certs', {'value' => $kombu_ssl_ca_certs})
  } else {
    ensure_resource($name, 'oslo_messaging_rabbit/kombu_ssl_ca_certs', {'ensure' => 'absent'})
  }

  if $kombu_reconnect_delay {
    ensure_resource($name, 'oslo_messaging_rabbit/kombu_reconnect_delay', {'value' => $kombu_reconnect_delay})
  } else {
    ensure_resource($name, 'oslo_messaging_rabbit/kombu_reconnect_delay', {'ensure' => 'absent'})
  }

  if $rabbit_host {
    ensure_resource($name, 'oslo_messaging_rabbit/rabbit_host', {'value' => $rabbit_host})
  } else {
    ensure_resource($name, 'oslo_messaging_rabbit/rabbit_host', {'ensure' => 'absent'})
  }

  if $rabbit_port {
    ensure_resource($name, 'oslo_messaging_rabbit/rabbit_port', {'value' => $rabbit_port})
  } else {
    ensure_resource($name, 'oslo_messaging_rabbit/rabbit_port', {'ensure' => 'absent'})
  }

  if $rabbit_hosts {
    validate_array($rabbit_hosts)
    ensure_resource($name, 'oslo_messaging_rabbit/rabbit_hosts', {'value' => join($rabbit_hosts, ',')})
  } else {
    ensure_resource($name, 'oslo_messaging_rabbit/rabbit_hosts', {'ensure' => 'absent'})
  }

  ensure_resource($name, 'oslo_messaging_rabbit/rabbit_use_ssl', {'value' => $rabbit_use_ssl})

  if $rabbit_userid {
    ensure_resource($name, 'oslo_messaging_rabbit/rabbit_userid', {'value' => $rabbit_userid})
  } else {
    ensure_resource($name, 'oslo_messaging_rabbit/rabbit_userid', {'ensure' => 'absent'})
  }

  if $rabbit_password {
    ensure_resource($name, 'oslo_messaging_rabbit/rabbit_password', {'value' => $rabbit_password, 'secret' => true})
  } else {
    ensure_resource($name, 'oslo_messaging_rabbit/rabbit_password', {'ensure' => 'absent'})
  }

  if $rabbit_login_method {
    ensure_resource($name, 'oslo_messaging_rabbit/rabbit_login_method', {'value' => $rabbit_login_method})
  } else {
    ensure_resource($name, 'oslo_messaging_rabbit/rabbit_login_method', {'ensure' => 'absent'})
  }

  if $rabbit_virtual_host {
    ensure_resource($name, 'oslo_messaging_rabbit/rabbit_virtual_host', {'value' => $rabbit_virtual_host})
  } else {
    ensure_resource($name, 'oslo_messaging_rabbit/rabbit_virtual_host', {'ensure' => 'absent'})
  }

  if $rabbit_retry_interval {
    ensure_resource($name, 'oslo_messaging_rabbit/rabbit_retry_interval', {'value' => $rabbit_retry_interval})
  } else {
    ensure_resource($name, 'oslo_messaging_rabbit/rabbit_retry_interval', {'ensure' => 'absent'})
  }

  if $rabbit_retry_backoff {
    ensure_resource($name, 'oslo_messaging_rabbit/rabbit_retry_backoff', {'value' => $rabbit_retry_backoff})
  } else {
    ensure_resource($name, 'oslo_messaging_rabbit/rabbit_retry_backoff', {'ensure' => 'absent'})
  }

  if $rabbit_max_retries {
    ensure_resource($name, 'oslo_messaging_rabbit/rabbit_max_retries', {'value' => $rabbit_max_retries})
  } else {
    ensure_resource($name, 'oslo_messaging_rabbit/rabbit_max_retries', {'ensure' => 'absent'})
  }

  ensure_resource($name, 'oslo_messaging_rabbit/rabbit_ha_queues', {'value' => $rabbit_ha_queues})

  if $heartbeat_timeout_threshold {
    ensure_resource($name, 'oslo_messaging_rabbit/heartbeat_timeout_threshold', {'value' => $heartbeat_timeout_threshold})
  } else {
    ensure_resource($name, 'oslo_messaging_rabbit/heartbeat_timeout_threshold', {'ensure' => 'absent'})
  }

  if $heartbeat_rate {
    ensure_resource($name, 'oslo_messaging_rabbit/heartbeat_rate', {'value' => $heartbeat_rate})
  } else {
    ensure_resource($name, 'oslo_messaging_rabbit/heartbeat_rate', {'ensure' => 'absent'})
  }

}
