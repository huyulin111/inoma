package com.kaifantech.init.sys;

public class SystemInitDB {
	private static final String SYSTEM_INIT_DB_KEY = "kf_csy_daj_";

	public static final String OP_DB_NAME = SYSTEM_INIT_DB_KEY + "agv";
	public static final String BUSS_DB_NAME = SYSTEM_INIT_DB_KEY + "acs";
	public static final String IOT_DB_NAME = SYSTEM_INIT_DB_KEY + "iot";
	public static final String DE_DB_NAME = SYSTEM_INIT_DB_KEY + "de";
	public static final String WMS_DB_NAME = SYSTEM_INIT_DB_KEY + "wms";

	public static final String KF_BAK = "kf_bak";

	public static final String CONF_DB_NAME = SYSTEM_INIT_DB_KEY + "_conf";
	public static final String CACHE_CONF_DB_NAME = SYSTEM_INIT_DB_KEY + "_cache_conf";
	public static final String CACHE_SOCKET_DB_NAME = SYSTEM_INIT_DB_KEY + "_cache_socket";
}