<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'admin' );

/** MySQL database password */
define( 'DB_PASSWORD', 'password' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
/**#@-*/
define('AUTH_KEY',         'Z8f=p50l&D9oWD*J:.^|toCyxuN-B7z.<C-h-||>tc~,y%e8ulk}*eZsf0d>[Qa6');
define('SECURE_AUTH_KEY',  'sL1Z34U{sMv`Xpx!~(y?kWhJ^I{o.K{ZM<$?A*I|p|p=n>~oL H}GJ_,_]aX p`%');
define('LOGGED_IN_KEY',    '7b3-eRZ)]JN[)J05$+Sh4#$`.+lOgYc-nM:FIxw/mAvjWo%W0xx_zKx3`w8k/Cd9');
define('NONCE_KEY',        '.-8B?$|-A]-lv(LD$_zn~(GV=b11DnS?r|wloiGeQ_Q<j]#QtcD})yzQd-CI%Ypk');
define('AUTH_SALT',        'PEkZ*fm]$H?]hB*|a(9MB)Sfl,n;HB{?Ku@{Ud@ifzaS)xatZH?s0(q,6$Ke$}-(');
define('SECURE_AUTH_SALT', 'g?6H]YSNGXOxvObE]6;GHs{b}cI?>:65}]{QDE.M?0Vj?FUr|1$x*H86H)sYE/^w');
define('LOGGED_IN_SALT',   'M7m=TY=>;-b$|MPiQz&FT3`ZECQjm-te`9;`^SU9TNRadKn6!SJInE!R>SMTP|~7');
define('NONCE_SALT',       '|;76|wEyV!;2{d(BSZSNt$FP1+B|dc0KtDVgD _Ush0Geb|Uh;;Sd3bdm 1)!?vF');
/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 * 
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
		define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Sets up WordPress vars and included files. */
require_once( ABSPATH . 'wp-settings.php' );