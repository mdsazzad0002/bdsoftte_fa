<?php
defined('BASEPATH') or exit('No direct script access allowed');

$active_group = 'default';
$query_builder = TRUE;

$db['default'] = array(
	'dsn'	=> '',
	'hostname' => '127.0.0.1',

	'username' => 'bdsoftte_fa_u',
	'password' => 't^ZM.e)fNwc(BNH#',
	'database' => 'bdsoftte_fa',


	// 	'username' => 'u645478689_supershop_u',
	// 'password' => '6dO#0YIH6W?+',
	// 'database' => 'u645478689_supershop',

	// 'username' => 'root',
	// 'password' => '',
	// 'database' => 'bdsoftte_fa',
	// 'port' => '3307',


	'dbdriver' => 'mysqli',
	'dbprefix' => '',
	'pconnect' => FALSE,
	'db_debug' => (ENVIRONMENT !== 'production'),
	'cache_on' => FALSE,
	'cachedir' => '',
	'char_set' => 'utf8',
	'dbcollat' => 'utf8_general_ci',
	'swap_pre' => '',
	'encrypt' => FALSE,
	'compress' => FALSE,
	'stricton' => FALSE,
	'failover' => array(),
	'save_queries' => TRUE
);
