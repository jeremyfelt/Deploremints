<?php

/**
 * Do some basic verification to determine the request is coming from Bitbucket
 */

// Requests always come from the same IP address
if ( ! isset( $_SERVER['REMOTE_ADDR'] ) || '63.246.22.222' !== $_SERVER['REMOTE_ADDR'] )
	die();

// Requests always have the same user agent
if ( ! isset( $_SERVER['HTTP_USER_AGENT'] ) || 'Bitbucket.org' !== $_SERVER['HTTP_USER_AGENT'] )
	die();

// Requests always have the same content type header
if ( ! isset( $_SERVER['CONTENT_TYPE'] ) || 'application/x-www-form-urlencoded' !== $_SERVER['CONTENT_TYPE'] )
	die();

// And requests always have a payload
if ( ! isset( $_POST['payload'] ) || empty( $_POST['payload'] ) )
	die();

// So get that payload and turn it into something easy to use
$data = json_decode( $_POST['payload'] );

// If a valid response can't be given, we'll see NULL
if ( is_null( $data ) )
	die();

